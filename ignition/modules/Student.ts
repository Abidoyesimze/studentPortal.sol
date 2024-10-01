import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


const StudentPortalModule = buildModule("StudentPortalModule", (m) => {

  const student = m.contract("studentPortal");

  return { student };
});

export default StudentPortalModule;
