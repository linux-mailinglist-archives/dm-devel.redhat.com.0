Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE44C4F732C
	for <lists+dm-devel@lfdr.de>; Thu,  7 Apr 2022 05:22:26 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-paiDXfNiNh-rKahQIanfFQ-1; Wed, 06 Apr 2022 23:22:22 -0400
X-MC-Unique: paiDXfNiNh-rKahQIanfFQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5290C801585;
	Thu,  7 Apr 2022 03:22:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 340DEC28102;
	Thu,  7 Apr 2022 03:22:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EA08A193F6E1;
	Thu,  7 Apr 2022 03:22:17 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4518C1949763
 for <dm-devel@listman.corp.redhat.com>; Thu,  7 Apr 2022 03:22:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 17961C28109; Thu,  7 Apr 2022 03:22:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 128E6C28102
 for <dm-devel@redhat.com>; Thu,  7 Apr 2022 03:22:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E82FE299E762
 for <dm-devel@redhat.com>; Thu,  7 Apr 2022 03:22:15 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-hV8y3_wUNMSABdotjSW2yg-1; Wed, 06 Apr 2022 23:22:12 -0400
X-MC-Unique: hV8y3_wUNMSABdotjSW2yg-1
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2371SjBS024505; 
 Thu, 7 Apr 2022 03:16:28 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6f1targg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:16:27 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23736gj5016366; Thu, 7 Apr 2022 03:16:27 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f97y72jh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Apr 2022 03:16:27 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4408.namprd10.prod.outlook.com (2603:10b6:510:39::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Thu, 7 Apr
 2022 03:16:25 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::48e3:d153:6df4:fbed%4]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 03:16:25 +0000
To: Christoph Hellwig via Ocfs2-devel <ocfs2-devel@oss.oracle.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq14k35k2h9.fsf@ca-mkp.ca.oracle.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-11-hch@lst.de>
Date: Wed, 06 Apr 2022 23:16:22 -0400
In-Reply-To: <20220406060516.409838-11-hch@lst.de> (Christoph Hellwig via
 Ocfs2-devel's message of "Wed, 6 Apr 2022 08:04:59 +0200")
X-ClientProxiedBy: BYAPR07CA0077.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::18) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f462271-2218-4474-a0d3-08da1844ff73
X-MS-TrafficTypeDiagnostic: PH0PR10MB4408:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4408AE965ED0AB2544822BF28EE69@PH0PR10MB4408.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: NMmh+ZQkavrZ5cLbUFkqRpr7UKCi9jo+ltTf6PUYmds3TizqkdwQnoCwKSxZMljAA3tJuCEL/MJObq6aVMKnoZCKQqUAcsjosyZY2BxNwm/LJRIQGaYzz7Ws0cD2MY3+9QJKH0+fRGi4vT6g4i+vI3gP7jEbfGEnTX9Q9yaimvyzRGp3ReMnwLiiHoVt4NmMi4i19q3NHtL6oIdEH8KK39O3zwyJUUz+cFHMBqY3TUvZIM6pLdBBIZWZjpIQb9cIVOesvwty/6hYIt5UFfexVAOHA+7LCpQBKM0KWjF2QXGHHDm4KN1yChXbcJZaTAurki4hx5oSu1gdSdhyuES2RxoogeQ8U+3ijGwG8xJbxXmX+5qYemwY2w3dxz+W/IZ6LLbVyUM6QTc0zo7GhYQKtFICKiGxRKzEIp5IoPYVnFXqYIN+/JSXL/djlnJnz2YRHxtGaHutvnxfTymiRbbyrrd22DkHvQIgU3W9XOcXLz+Sllw3hmm5WnJToqM2+OhZANuRWGOSyf1vTyoU9jShqq/hL4OoQXswbd4FYrGHQEr/Z4gobNIop0w45O47qg/mkBU0wtANumIpzIhnALOUVdA/ovm395J/UDLOscRojhQhrvYl7cjim6SZ96hzCByfOuRvHDkWe7YaTa5jUpkiZPbah3i6kU903QdA835ZUxbEBEkK34ka4qSZD5lIFbaW4CqZlOxLgRmHyzJV1dlknw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6512007)(26005)(6666004)(6506007)(36916002)(52116002)(7416002)(83380400001)(186003)(5660300002)(2906002)(8936002)(54906003)(316002)(66946007)(38350700002)(38100700002)(6486002)(6862004)(66556008)(4326008)(8676002)(66476007)(86362001)(558084003);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dqm37A3fFwPDBYCZ8m/YhNWV2AakwE7LCtT1gRQIWx3qs4R/6xQkkBL59DZP?=
 =?us-ascii?Q?tcgNVzh5hC3cZfEax8MgfE4B5jpU4dFX7o+vtjh8GWF3fhNkbC5rfTVAcoYc?=
 =?us-ascii?Q?F6YQkSxJ7KpO69eS9B53LSLJcVHiheWWu71iDzKzgzCumtcJkLSmKk5mi800?=
 =?us-ascii?Q?TAW+VdVcQ3NxBzZ9huoW/00HSSJlzkPmwysdfXNaGk8ivQmzMo7G6xctKZ+p?=
 =?us-ascii?Q?pJop70//r+SZ/qN1N2X+wpcXL7QWQKHmzjHQjOro42e3xQuwxTQpp0kPQ7P3?=
 =?us-ascii?Q?GTDptxumWKmJVGFwtYUqt5vIPKUQnASodEAN+PDxEEsDf2FvbBtttNDQZEn2?=
 =?us-ascii?Q?3026vtNQa/f0GamZ3ujPmBrdSDobtKSWo6l0/AhdzLM0Z4Qfv9kHcMVcvrly?=
 =?us-ascii?Q?zb1K7TDD2MR4qtn58KjRskwnWpzNvIFgIjhpI3WUk5LGTV00uuvvQiihzq92?=
 =?us-ascii?Q?txUDhW+yWQf3jKyYHIAoFEXXtr23ZBYSglWsm1/Hbq2+nmg9GBU2xqlOgwrk?=
 =?us-ascii?Q?d8aK8G2jsHqMJc281/q/Ujlx7M87J5MpPv5qWojTV9AN47ZZ/k7gfXa8iWeE?=
 =?us-ascii?Q?55H9HEh9teG57zClCOXhd4OWFStqefQG55c3G2pv6tKm9/pN6XdpLJvjwDsw?=
 =?us-ascii?Q?697KrnbmCtd4Nfrn5tqytr+GkJh3WIhrH7eRhgpbIYS4k5nH7GqiDT1pf++8?=
 =?us-ascii?Q?N030bLWALhKSPDDEwgVQa176rVM7mbmETd6fVgEqiahkEsrI/nhJc3UGc2a4?=
 =?us-ascii?Q?wszywQotJJRyizFJBoQeALldKHp0dg46fnriHefKPnSgrlDy7TgQUMZd1uGH?=
 =?us-ascii?Q?lWwX6C5SCP/Hs0EUCRizmir4s3mYjZM3qwx4H2A0GtXHC2tVOIFlvc+dfUGV?=
 =?us-ascii?Q?bnVndkEyMM+us1GQ2RuBeCuvzHBHq87NGlv536NRiNPKrMDYIDVT96UjQM4H?=
 =?us-ascii?Q?M/DD3EivG+FNZ8JNuBkIoveCWwcAWZ+oXYoT3/jTlQZBuUuNQNKwmRfm5AlE?=
 =?us-ascii?Q?bTg90C0SIJhNMh0rPLLGBbWnfE9RTfpAeq9B2B43VTbZiDvzYdhbb6QjbRkp?=
 =?us-ascii?Q?x0G9q8McPIx6dSa1cBSMzaUG3QGfdWa00WLUx5SguMDX91RNGL36TuUYy3MQ?=
 =?us-ascii?Q?0K8scPp4RHWSgnXbmTByotwN+QrSf2q+RXRV3cSbvCRQ6SZzWwHrvs7sp/+3?=
 =?us-ascii?Q?ZWhY0CdB//Im55dbkm6sDk4YX0nmDXEs9ZOLdNwaSUvd8eLr2nZIRD7/iVae?=
 =?us-ascii?Q?jplBeAIfmklP33Z8djBa8X0watCnKZMH927IcGT0oXozJvzjLQsc67Z404Jw?=
 =?us-ascii?Q?bOluilJSSWOHqUdwRfpGwNdFqmnHnuqeuGMpTdvDEf86jjkYS4E3GiTCzTbt?=
 =?us-ascii?Q?y6kTuBxeZnHUMd9V952getEXjmZhQOgbPOFiLS6tWqbfN+MAWJ/81TUn1VVZ?=
 =?us-ascii?Q?Z+MCst2/AhtYvzRCiilkT7efQBLgRZ7J5qWDKmUnseKtgrPn3uKC9MyJUahv?=
 =?us-ascii?Q?gSvUSkv0aDo3FHA4AtFpdH+r4yWCGyO4ymjBY4rq4gF8dgIBoF1zUsuKqIm/?=
 =?us-ascii?Q?mHdy7HBL2OL+vC/I+vXrzr50rbyUdRwTZS5MVgdQsOKV/1c/p4g4Bvtgoi/Y?=
 =?us-ascii?Q?JWWj+Ci1k6TOmCebOE9WcIJVhgnp4u35pOkOt3pus7871K27tM9hRrl22iCd?=
 =?us-ascii?Q?dEE18UQJWBetzeHiyP04vFn4ks5ZHZmnzqiMqDbKPySW8jnxzy10+H6JqMIs?=
 =?us-ascii?Q?atFkzk62ROIcd8UrP9QgdHcETbD3fHs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f462271-2218-4474-a0d3-08da1844ff73
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 03:16:25.0831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXFvtoZt+QZMvRB6K4PJ4QiEIxz8aILvosFrOC8hdGeBDG9wKGnZ1zG8skw3ymsA5ydm145Ye8FME6355LIf/PPAyCH3Foo/UE50UBcpBQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4408
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-06_13:2022-04-06,
 2022-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=951 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204070016
X-Proofpoint-ORIG-GUID: S_lfOALZEJ9FyQJROgu5wgM4eBntOwtZ
X-Proofpoint-GUID: S_lfOALZEJ9FyQJROgu5wgM4eBntOwtZ
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [dm-devel] [Ocfs2-devel] [PATCH 10/27] block: add a bdev_nonrot
 helper
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
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Christoph,

> Add a helper to check the nonrot flag based on the block_device
> instead of having to poke into the block layer internal request_queue.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

