Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3848753C5D4
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jun 2022 09:18:11 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-Qr6BLvDKNbKXO4eh8lMERQ-1; Fri, 03 Jun 2022 03:18:08 -0400
X-MC-Unique: Qr6BLvDKNbKXO4eh8lMERQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC1CE858EFE;
	Fri,  3 Jun 2022 07:18:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58251406AD48;
	Fri,  3 Jun 2022 07:18:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 56D741947067;
	Fri,  3 Jun 2022 07:17:58 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 95BF51947040
 for <dm-devel@listman.corp.redhat.com>; Fri,  3 Jun 2022 06:58:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 86AF9C27E92; Fri,  3 Jun 2022 06:58:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81A48C23DBF
 for <dm-devel@redhat.com>; Fri,  3 Jun 2022 06:58:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 654473C0F752
 for <dm-devel@redhat.com>; Fri,  3 Jun 2022 06:58:12 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-vkpyYbgdPzCVebOJG7vv3w-1; Fri, 03 Jun 2022 02:58:10 -0400
X-MC-Unique: vkpyYbgdPzCVebOJG7vv3w-1
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2531ZDGo019365;
 Fri, 3 Jun 2022 06:56:02 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gf8rwrbf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Jun 2022 06:56:02 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2536oJc4001837; Fri, 3 Jun 2022 06:56:02 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gc8hyxp4e-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Jun 2022 06:56:01 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 BYAPR10MB2789.namprd10.prod.outlook.com (2603:10b6:a03:82::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.19; Fri, 3 Jun 2022 06:56:00 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::f81d:b8ef:c5a4:9c9b]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::f81d:b8ef:c5a4:9c9b%3]) with mapi id 15.20.5293.019; Fri, 3 Jun 2022
 06:56:00 +0000
From: Mike Christie <michael.christie@oracle.com>
To: linux-block@vger.kernel.org, dm-devel@redhat.com, snitzer@kernel.org,
 hch@lst.de, axboe@kernel.dk, martin.petersen@oracle.com,
 james.bottomley@hansenpartnership.com, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org
Date: Fri,  3 Jun 2022 01:55:35 -0500
Message-Id: <20220603065536.5641-11-michael.christie@oracle.com>
In-Reply-To: <20220603065536.5641-1-michael.christie@oracle.com>
References: <20220603065536.5641-1-michael.christie@oracle.com>
X-ClientProxiedBy: DM5PR16CA0012.namprd16.prod.outlook.com
 (2603:10b6:3:c0::22) To DM5PR10MB1466.namprd10.prod.outlook.com
 (2603:10b6:3:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40893671-3b67-41cd-ca12-08da452e1abd
X-MS-TrafficTypeDiagnostic: BYAPR10MB2789:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB27890E76005763C6C042A202F1A19@BYAPR10MB2789.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: KeOR0yMzESPKEwLyGdKwcIyJyRSFo3O/kOlSst/HrjQgTOED4V0AV3Vh1IpwUpVWy3edHmvkkVimx7LHegAJeCBqUqh+oRUFEKreynpOl3NgqJzmwKQE+O6MmAt+O5mLVUhlxS940xtYsVwJwCpOExA5QQ8zGEDxNPNxU3Ho76PwIcPb/R9H22gQGu5QfzIIHo366kSpBfJDAs4eF4geOAKDIOG6G01XSEVuFPHpLYIDa9GFyn60cGObCPOo+c4gPxTzx8+slUC/gdoIX6NJV17e3HpSsyqrhu+hSX88xjGKxEKjsXWDC2pQoc+wSIzxJkAKv/HOG3MlYWuFiIbXuEwLWebGbgc9cMkHY4bly8f5syV928JkJT4mVybSinOVsRR00WX8+nqNwl7uhUS6BEZwku/VohsRje/+0HzBXybk3pih62y4R5s9TXz5qFXIAKsS6qmUonL/TYLKSDxws/AZ9rEAaf9qMRIzfAisbUCoRq8k5uVJxSqMDr6hxXUxHXkNIkGhL1w5TNybCP1rgaNSoxUoNlTYr2O0O2u7rKEP2+5137V980NPgdAfXhB/Dt6rxBFlwPC1yDJsrcjueDUEoa1LwUudsearXBxA37sIVr/Pk4tVq1ZspNyvpwzgpqAblvScETgGKtRjpwlbMSmHlP8QmC87jUR32DZtuTBMdxPvoUC+wATAXZwJfreMZJdtnlbbpxE4Qsd7SCHMNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(8676002)(38350700002)(38100700002)(66476007)(4326008)(66556008)(86362001)(83380400001)(36756003)(8936002)(107886003)(6486002)(2616005)(316002)(5660300002)(1076003)(6512007)(26005)(2906002)(6506007)(52116002)(186003)(6666004)(508600001);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iPx+Rubzu6tnTqcVVEGg+KKIzIRu5Q5+tl1dJ4L1xpEaHP/5blRt+5coDOLu?=
 =?us-ascii?Q?JUAhUetDytsORvIyB/xyOC70zZynssncQJWo2iOsoZNABqtqBBAPk8FasoVs?=
 =?us-ascii?Q?rxUs6q6jOSSAymtk2fSEdVLkVzKOqAWhP3Pun/Sv2/JbjUhRMXvKYtO5QnHf?=
 =?us-ascii?Q?0EtfvWkSuTqi/B7LS79E1KuxQ7waoER07L10gM9CMkvI7c6AYMteyVyAgY0o?=
 =?us-ascii?Q?PXBJlfn/IXrYkZzRY9KYfzswjww/9bJqu35gJN1fMpOQj+hZzLJwX09Iqv7T?=
 =?us-ascii?Q?QRGlb9prYUxcFD0/3IYfasww4LEdvQEMF9mOg76s4rVmnWCdYRPVfRQRLtJ/?=
 =?us-ascii?Q?2wUI49gTBkxQCccSpT2WRt1SNeiikgWMbqMvz7cHyrodaww3Ksd4wjPx7Dc/?=
 =?us-ascii?Q?ux/k1YUemcc/9N9VOgszSviPpbrMlmZGSL/cFHh4z0WON4mY/cCm5w3FaVrg?=
 =?us-ascii?Q?EWt/HyRqCt4T6+jazAGckKvGxTPMJb225Iab7KzFiwr86yjgV2I7NeB3g0LI?=
 =?us-ascii?Q?X+jmcILYYqWTxjMvlLNG+dUFPDJJ3He6iN6tpBZEOjJsViQ01mD+XgvV3HJT?=
 =?us-ascii?Q?Sc93+K+WIZcuog2gAuQL8PNp7WOkpjY2HfqxIhXixrD3ORn6pXts2yapcBq8?=
 =?us-ascii?Q?iv40nj+Co+ePpEKGAEvKmPOb8ozK50OuuPTbBQ5d3JVAh/Y84/Ci6EWtIW7+?=
 =?us-ascii?Q?khp9rpKsPuxJBY4nCslkMLdnFuq67JDO3mXxQIVVNvSQcQSx8mHHalRxEE2E?=
 =?us-ascii?Q?6s88vei5jXWe/jj6Rkt+WCSRormWvKUgUNCzPuEU0qP8BAvwKHhTghfNMfhS?=
 =?us-ascii?Q?UsoLX7Wx0FUwrc1LKAgLiz8ap8ajkeCQgFzKWlxqnj4tEtTZoha8fki4nRAT?=
 =?us-ascii?Q?BPVOy5x6qGTZLSP0Xzq9oufsfxQjk1y4jJVJhvRf2+JHNR/PAioH7Dw8qs5W?=
 =?us-ascii?Q?gm3Fy2o9jvmdvQXoab9dn8/z0dUuVx8xn7jJY0CqACZLl9UIz+cQtNrjXZzJ?=
 =?us-ascii?Q?BoGufQDmmq7SvhUXj7eBaJW/UGXhKV34TwnssOoLzSoeJ/lvqBs3xLG/UsGX?=
 =?us-ascii?Q?yvab0jNUGTRFOIdFiRY0cXchr636DPCoxa8rXqK31I80WKDnXC0qRNDqPE6o?=
 =?us-ascii?Q?Xb/cTgge6rZCi6q0Fw4MMBsmVUKkiJCn5Gd570TVELLPWsXXlYtMBDMQTHrC?=
 =?us-ascii?Q?xjn/juAaipxN3RqEn66GPa2AiLPif+hnIoDFUYzYAeEMNmzPy6xqRxjwsuY2?=
 =?us-ascii?Q?G+IOM18mXGcmAJnEV2bbXV7TDM3KTG9eg1E+d4+s9K39aOCrRmqCavx9m4Dc?=
 =?us-ascii?Q?/Afa/jXfxMktyqW4sFQi535DKza1lwc5hh8SudVlTUEx3kkqJKECnDq0mPiJ?=
 =?us-ascii?Q?f29XkYJVrk2mw8Mx2tQhQPb0Xp9r5XRgk4wrUUazHxbf9ERRb4/SrRMBWe5y?=
 =?us-ascii?Q?UBcaWBNpjQ2H74TXHSuLoX/lP7/WVRuM2fNqrrz9Jwq9p46LR+vRacZaN9Xr?=
 =?us-ascii?Q?yI45M6/07PaEVmYuGmZL3kFn8UD6PqCUQ/Iq9REAd+KQyCoPgdf1gOaXJQU2?=
 =?us-ascii?Q?iiO0PD5EXXrMD/tY3nHnOxpcfXbe80XGsG2iNFZClKXKIUhLfs3Zqq95u7mK?=
 =?us-ascii?Q?d5KL8+w6Pos7PvPhdGT5+3I6Da8RcUgywujVG6HKpdPB9X3Ogj9/giHyGgGK?=
 =?us-ascii?Q?tEn23z3wnjAxfzDUEmpxqoKocXKFhI3EuY5JYkAyJrGtmTuFDi7nkHk/oEyP?=
 =?us-ascii?Q?Rjn8DUZqZz2mCo+Mc8HlkQ/W7g6Ebwc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40893671-3b67-41cd-ca12-08da452e1abd
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 06:55:54.8460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWhfROPj0TPnSPVYZyqv23BD1YUTKIZZqB4r6XZwWB7/cvn/a/POqedg2y6GHqJe/Ld8jugdR4FUDDct71GPHC71CuSJhZjOxiTV7ve6pfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2789
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-03_02:2022-06-02,
 2022-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206030029
X-Proofpoint-GUID: xyZOZP5iyoXz9InAwD2vOS8W45amKg3G
X-Proofpoint-ORIG-GUID: xyZOZP5iyoXz9InAwD2vOS8W45amKg3G
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mailman-Approved-At: Fri, 03 Jun 2022 07:17:56 +0000
Subject: [dm-devel] [PATCH 10/11] scsi: Use BLK_STS_RSV_CONFLICT for
 reservation conflicts
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Mike Christie <michael.christie@oracle.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This has scsi use BLK_STS_RSV_CONFLICT for reservation conflicts so upper
layers like lio can distinguish this between a general nexus error and a
reservation conflict. For the latter we can then report that error to VMs.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/scsi/scsi_error.c |  1 -
 drivers/scsi/scsi_lib.c   | 11 ++++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/scsi_error.c b/drivers/scsi/scsi_error.c
index cdaca13ac1f1..621627486e5c 100644
--- a/drivers/scsi/scsi_error.c
+++ b/drivers/scsi/scsi_error.c
@@ -1985,7 +1985,6 @@ enum scsi_disposition scsi_decide_disposition(struct scsi_cmnd *scmd)
 	case SAM_STAT_RESERVATION_CONFLICT:
 		sdev_printk(KERN_INFO, scmd->device,
 			    "reservation conflict\n");
-		set_host_byte(scmd, DID_NEXUS_FAILURE);
 		return SUCCESS; /* causes immediate i/o error */
 	}
 	return FAILED;
diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 8d18cc7e510e..623dc1cee51e 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -597,7 +597,7 @@ static blk_status_t scsi_result_to_blk_status(struct scsi_cmnd *cmd, int result)
 	case DID_OK:
 		if (scsi_status_is_good(result))
 			return BLK_STS_OK;
-		return BLK_STS_IOERR;
+		break;
 	case DID_TRANSPORT_FAILFAST:
 	case DID_TRANSPORT_MARGINAL:
 		return BLK_STS_TRANSPORT;
@@ -613,9 +613,14 @@ static blk_status_t scsi_result_to_blk_status(struct scsi_cmnd *cmd, int result)
 	case DID_MEDIUM_ERROR:
 		set_host_byte(cmd, DID_OK);
 		return BLK_STS_MEDIUM;
-	default:
-		return BLK_STS_IOERR;
 	}
+
+	switch (get_status_byte(cmd)) {
+	case SAM_STAT_RESERVATION_CONFLICT:
+		return BLK_STS_RSV_CONFLICT;
+	}
+
+	return BLK_STS_IOERR;
 }
 
 /**
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

