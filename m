Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B86A3B7F
	for <lists+dm-devel@lfdr.de>; Mon, 27 Feb 2023 08:04:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677481445;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GaUDAyhCyEDX0r/e0jteQPSajGPSW1M4PJAKkxMUvoo=;
	b=GUGyBAsgp3xBxUu5WkQPzX7GfJ7yynhzzY9dQ1zON7g+NJJb5VUq8e02Ox7aesWJJZtA0X
	agJ8K7TocvPbMvYQawvMh1raaB7KXTe3EJqhOuOk2L52iVJ8QUJgQ6dqlTSyew6pSaMV/k
	4SG5WRuKjBcDnWwlif2JKqMXZQmmybA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-Kd5HK1OgPm2xamQIDTsQTw-1; Mon, 27 Feb 2023 02:03:44 -0500
X-MC-Unique: Kd5HK1OgPm2xamQIDTsQTw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66312100F915;
	Mon, 27 Feb 2023 07:03:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3EE2492B0F;
	Mon, 27 Feb 2023 07:03:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E6F4219465B2;
	Mon, 27 Feb 2023 07:03:36 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 953FF19465B2
 for <dm-devel@listman.corp.redhat.com>; Fri, 24 Feb 2023 17:47:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6B7662026D38; Fri, 24 Feb 2023 17:47:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62D702026D4B
 for <dm-devel@redhat.com>; Fri, 24 Feb 2023 17:47:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F60A18E0044
 for <dm-devel@redhat.com>; Fri, 24 Feb 2023 17:47:50 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-wrvyjLwSNHG_YKbHGLsGzA-1; Fri, 24 Feb 2023 12:47:48 -0500
X-MC-Unique: wrvyjLwSNHG_YKbHGLsGzA-1
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31OHhqCE003290; Fri, 24 Feb 2023 17:45:30 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntpqcntjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Feb 2023 17:45:30 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31OGY1aV000677; Fri, 24 Feb 2023 17:45:30 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nxsb4kud4-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Feb 2023 17:45:30 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 CH0PR10MB7535.namprd10.prod.outlook.com (2603:10b6:610:187::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.7; Fri, 24 Feb
 2023 17:45:28 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::7dd7:8d22:104:8d64]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::7dd7:8d22:104:8d64%7]) with mapi id 15.20.6156.007; Fri, 24 Feb 2023
 17:45:28 +0000
From: Mike Christie <michael.christie@oracle.com>
To: bvanassche@acm.org, hch@lst.de, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, james.bottomley@hansenpartnership.com,
 linux-block@vger.kernel.org, dm-devel@redhat.com, snitzer@kernel.org,
 axboe@kernel.dk, linux-nvme@lists.infradead.org, chaitanyak@nvidia.com,
 kbusch@kernel.org, target-devel@vger.kernel.org
Date: Fri, 24 Feb 2023 11:45:00 -0600
Message-Id: <20230224174502.321490-17-michael.christie@oracle.com>
In-Reply-To: <20230224174502.321490-1-michael.christie@oracle.com>
References: <20230224174502.321490-1-michael.christie@oracle.com>
X-ClientProxiedBy: DS7PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:8:2f::33) To DM5PR10MB1466.namprd10.prod.outlook.com
 (2603:10b6:3:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR10MB1466:EE_|CH0PR10MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa3cbf2-958b-463c-fcb8-08db168eeacd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: Pk/NDOHRjYZqTF4sSDKTer5XX1ohrfqLySLT9kIqGChyRl4gAYaew0BEyWW9ttfk6xOgkUyHWO+mXGPFoIimxXZMkQ0q/uQ+SfC0werZY4B5Zyfv+mpK5Noi/7RjwwVTR9Z2j06Jl69ayF3Ho9rle+jzvMdvDnRVRBVHAlYSP2PDTwERqcBJHIyNkeL0WrNjzBFdWIOOs6QgH4FihkarAIDb4lm16biOFhe4vVj5pnSBS8ukrLQQIcD5Sq8sTH4C1KsHZMKtvNrw/v4OxIm3a3TpeU4VMfhUFiJDMGePQWsoCHHCxrwpuYb1X9JpmSUZC/tlPLV34X++rCZExR8LVlt4v1JW9CsgFuGQ7jfRJMZToFMgeCQz6z+4RiA/eq+oFoZRoUOuKXJtZdt9hlZwMGGXcukG6aD1vpQ7c0e31kW8SDG4kyelOwsrzD/TITUDJBgIiqCRvK/rNOjr1Jo/AoQfpNLQo+Yv/UZQ2YWpMdlIMFWfKOH9IjnEg56N5xhO6VJ7MFio13lhcVb+lzreiv+nKSpHcUIfWQj0izqgAGd83ToEjwaDUYx4+6Eo1yuyDQhmB93s9PChIoZtMoTmzYHHHNTNZSboqw04RSYK3SImv3POP5pTUQ+RwLYllcGGwGxY55tLCURU953h2pUWo0FlnC970rhrgaYwsdP+DMIWxjDlxZtbjGf7mm02nPsw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199018)(4326008)(66476007)(66556008)(66946007)(8676002)(83380400001)(41300700001)(316002)(36756003)(186003)(8936002)(26005)(5660300002)(2616005)(38100700002)(7416002)(6512007)(921005)(86362001)(478600001)(2906002)(6486002)(6506007)(107886003)(1076003)(6666004);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mFVs4YQ/U29EYkcHCMf2gHwraxMhL+50oA8zTlB6v/soQC/4MbWIbSq8g26S?=
 =?us-ascii?Q?fSld6yxoGXBP4hvmUT+cl3nmhgQZ33iSRID0SOoURs1z1Q0NsuQdOl16qoNU?=
 =?us-ascii?Q?KC71esud5S5H2FTxnCfakW0wX3g/T+B1G8JMEov0JvEApoOv71h1UoSJElq7?=
 =?us-ascii?Q?gG0Ax8i5sZ7FwTQ2Tq4dmRzgaDkfTT1JuNKwcoAKd2uQQlq6vICVAlhmW2Qu?=
 =?us-ascii?Q?6D2F8ACBljyvuVyVYb+B/fuiLuxu37qTzszYNBKI9HxXEsRiIqxhhcBH6WgV?=
 =?us-ascii?Q?oD81A/hCTZ6xPSOCLxGgzZw70+1lFBKS163d+Ec2VpBg6wsD+OZTevZTZ8rS?=
 =?us-ascii?Q?PXBFJ/LXOBMfCVp3BOn2NJuCAAppw05D5iBntcaprkS0uKfVZQsN9Dp/G1B6?=
 =?us-ascii?Q?2Py/afSHza30+tIhfi9yvvNb23eQSNMRlaD56SZDq6UflSltaFfk7Pccc5Wq?=
 =?us-ascii?Q?cVfvOxrLJodKOouxTGBhYQxiilKKQdzmL15J9KzsJBVYPAqWbgZQuXuU3+Xj?=
 =?us-ascii?Q?cxdoTuvkdeQFfNRBUHfbVP04xoHLV4piTOlkUhEhkUldq7tin64x54UEBwOm?=
 =?us-ascii?Q?HpZ18qBASF7YZy4MvxTnkzYifa5idYtNILsaY1zccUt8gHVWtmgmcp8fAZUe?=
 =?us-ascii?Q?E01Dt8UfwNyk7J2O2uWcFKT5JN+c5RzxVa+/Um1r55ph100GnypY083XJglf?=
 =?us-ascii?Q?XcqLwpuG6/9gB0XaZZyj1YgJElNXBpz8mMGp8FRPOpYu30SdwuIlk2RMJ8L/?=
 =?us-ascii?Q?qb9v4gjKqClpbDT8v8NfVppoNX4j8Q5qsa5WjgwklANyyIsXch/QOVZCcYuC?=
 =?us-ascii?Q?xR7DZtoXHG165XtoWqE93IaYFqDtJsHpER1TGLFT6FoB+fra8DG7BF7w+gwM?=
 =?us-ascii?Q?plyqodkFNelS8QZEcXwjWc6DgVChIcfbTFn7FjZCnujuOgC2hkLHAYrfm32Q?=
 =?us-ascii?Q?iSmo4qWerNCNRUQOn3nbci93A0zo37r/3wF1ZmfKti37oWFpX5fGcxvD0tTG?=
 =?us-ascii?Q?OrxiCZxtgkJG014s0tu3RqY55ZKkXGkqfZVB7GNq5lfBMqdmFct1+VHP+o8I?=
 =?us-ascii?Q?e97wibi5lEwpuawMrctU2vv6tD3RfNTH0KUGbJvIcxsCK/EcxIG62re5Su57?=
 =?us-ascii?Q?4LQ+HuZasqf6/y+AEd7esO4euJx5CqztemZvOU9OTisjCabxRQwGP6Ck/qPt?=
 =?us-ascii?Q?SGNIOVd5MvEkQNqKCp36V+cg2tQ8IrR8lRjzXivXGZTUYNwyX3/JVfRQW+nH?=
 =?us-ascii?Q?QHzrWHKj73eYKVjMVdyeTEYJSh8ePv9VffkewiEQvIytCu1m8Plkf/bCOOOt?=
 =?us-ascii?Q?E1o9KDpYOG1OZftqhIfKmJdGLOxZLLCuE91W2x/RUf8hUkOtOijxvU1N2FZ7?=
 =?us-ascii?Q?QCRdi6oecVaVbgqbGoyLsV2inPp4kxfdE9sfqcLEkEue++FrBoAt+ngXAXML?=
 =?us-ascii?Q?vHYLA6psCuXd0/mk82aoRX7W0JNCMCgB3lwBShPXQUlksTRKBOU54/3Jokjp?=
 =?us-ascii?Q?p5QZEnJ6FTlWzbI8V1Ou/9ZGtBq6WNDH2K+DQ1fTAysEn9WT4sfJT5mFAToM?=
 =?us-ascii?Q?Y5njldBTd/F+Cd9Ym6MHGHq2CFG34O3j2Ph6k1WE2mN5wETa+2ZWm0NxxPEp?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?43918OYwmOfK93Vf+MnmOf+Y6Vt23KAqD4yIONMEj53sgamZML2/2zxg75sB?=
 =?us-ascii?Q?KR40XERnF5q+bzxaBHv3FJJDfLXSnfU/JhqPcPPLDd6yy2ROK/fGVThNzGVM?=
 =?us-ascii?Q?pkhpFODveJVkWoxpe5FHVuxrRxqEdLtzI0PQIbIYPFKhMxW5wkPuMljukn/n?=
 =?us-ascii?Q?7NntQnixwB2Uf2sSaJOElihTf0XP6jugzZhZ53Yv9GboBGG80vYdI9nbDW45?=
 =?us-ascii?Q?Ld75KYGCmt1uxReQGVWiXf5cq3IMQkARDfpzKc/9K8XdSF5QAL96bF1mBg1v?=
 =?us-ascii?Q?paRkQ8llVJnLjLMncZrapl+VGWF71xo5TWYKQTBMPh9SQ2Z+IWVQaRCnAM7d?=
 =?us-ascii?Q?m9ih7bhkJWxezUVsFCCpX0HKqYO2voR2afc+i9kfApu+OOsUmqlmmNOWcnku?=
 =?us-ascii?Q?W3x3mCj37s3lbDv67OyJ2bgjaWlILoIsJ9wgX0yPYv3x8GVvaMX8N+Y1y1K+?=
 =?us-ascii?Q?IlGRgxemj3v5JwrZZ458L403MXLDvlyK1CPGyXu5/j4mFRZxgObzUGhJFbs0?=
 =?us-ascii?Q?GRrNclksT0+HsXPCJfgs0XRx0XCxd3b9blrWiScbrbQ7G9L9RDTK3rTeNqWL?=
 =?us-ascii?Q?YSYi9Rsp2xJd2qUGNyMQ3px1C2z0lwOGvXmVM+i5P3aYXyGhisBN33SP7eta?=
 =?us-ascii?Q?dRXsN7v8MbOaY/zafU5/5vaim5wC5ZEca9hNzCAFBrRWrBApb7Gy1B9DgGdE?=
 =?us-ascii?Q?egqcu2IuPQ/5CjOggg8EVBuyV7JPTu+Z9fye8PS/h6u5Q0tSacw90iixMn5l?=
 =?us-ascii?Q?YKSuVEcIR+QMF3SO+jqR4Ywgowl/4nkShv3jEdkyS9N7NYVJcij6Yuvr8UuB?=
 =?us-ascii?Q?Be4Bq04bMSV/fQ70ez9g+mvzlqvnQYUcZXSx6/nZ80CtagJwOSaDeudZ3PVD?=
 =?us-ascii?Q?iTrIE/o7y7iyREOUkt0ARpM/mMUZOkhVFN6C9FpIVe8pMfNqtohysj988Ylo?=
 =?us-ascii?Q?+yU5GJqoczIE8pocIGBhUTTK5AhGMv1/ILlxHjLbW3TB6wJLcqjrjtpXwbPZ?=
 =?us-ascii?Q?nh+4XKsSzcnr5DnA8//qOZ6VQg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa3cbf2-958b-463c-fcb8-08db168eeacd
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 17:45:28.4998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PDvWvvlP7YVw+utwWb3LYwjJUVG2cDcJIt23EOUtzA38b3G96HCpxiV1PDBcSvf2GU4vDqm95MLNZgf/mf9+ENvE0kxDJjsswZr5hv4X/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7535
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_12,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302240139
X-Proofpoint-GUID: 6tXktHyy9pcXOS_GsOHb333fvSjtwej-
X-Proofpoint-ORIG-GUID: 6tXktHyy9pcXOS_GsOHb333fvSjtwej-
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Mon, 27 Feb 2023 07:03:30 +0000
Subject: [dm-devel] [PATCH v4 16/18] scsi: target: Pass struct
 target_opcode_descriptor to enabled
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The iblock pr_ops support does not support commands that require port or
I_T Nexus info. This adds a struct target_opcode_descriptor as an argument
to the enabled callout so we can still have the common tcm_is_pr_enabled
and tcm_is_scsi2_reservations_enabled functions and also determine if the
command is supported based on the command and service action and device
settings.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/target/target_core_spc.c  | 40 +++++++++++++++++++------------
 include/target/target_core_base.h |  3 ++-
 2 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/target/target_core_spc.c b/drivers/target/target_core_spc.c
index 00d34616df5d..caf8d1325007 100644
--- a/drivers/target/target_core_spc.c
+++ b/drivers/target/target_core_spc.c
@@ -1429,7 +1429,8 @@ static struct target_opcode_descriptor tcm_opcode_write_verify16 = {
 	.update_usage_bits = set_dpofua_usage_bits,
 };
 
-static bool tcm_is_ws_enabled(struct se_cmd *cmd)
+static bool tcm_is_ws_enabled(struct target_opcode_descriptor *descr,
+			      struct se_cmd *cmd)
 {
 	struct exec_cmd_ops *ops = cmd->protocol_data;
 	struct se_device *dev = cmd->se_dev;
@@ -1456,7 +1457,8 @@ static struct target_opcode_descriptor tcm_opcode_write_same32 = {
 	.update_usage_bits = set_dpofua_usage_bits32,
 };
 
-static bool tcm_is_caw_enabled(struct se_cmd *cmd)
+static bool tcm_is_caw_enabled(struct target_opcode_descriptor *descr,
+			       struct se_cmd *cmd)
 {
 	struct se_device *dev = cmd->se_dev;
 
@@ -1496,7 +1498,8 @@ static struct target_opcode_descriptor tcm_opcode_read_capacity16 = {
 		       0xff, 0xff, 0x00, SCSI_CONTROL_MASK},
 };
 
-static bool tcm_is_rep_ref_enabled(struct se_cmd *cmd)
+static bool tcm_is_rep_ref_enabled(struct target_opcode_descriptor *descr,
+				   struct se_cmd *cmd)
 {
 	struct se_device *dev = cmd->se_dev;
 
@@ -1507,7 +1510,6 @@ static bool tcm_is_rep_ref_enabled(struct se_cmd *cmd)
 	}
 	spin_unlock(&dev->t10_alua.lba_map_lock);
 	return true;
-
 }
 
 static struct target_opcode_descriptor tcm_opcode_read_report_refferals = {
@@ -1542,7 +1544,8 @@ static struct target_opcode_descriptor tcm_opcode_sync_cache16 = {
 		       0xff, 0xff, SCSI_GROUP_NUMBER_MASK, SCSI_CONTROL_MASK},
 };
 
-static bool tcm_is_unmap_enabled(struct se_cmd *cmd)
+static bool tcm_is_unmap_enabled(struct target_opcode_descriptor *descr,
+				 struct se_cmd *cmd)
 {
 	struct exec_cmd_ops *ops = cmd->protocol_data;
 	struct se_device *dev = cmd->se_dev;
@@ -1664,7 +1667,8 @@ static struct target_opcode_descriptor tcm_opcode_pri_read_resrv = {
 		       0xff, SCSI_CONTROL_MASK},
 };
 
-static bool tcm_is_pr_enabled(struct se_cmd *cmd)
+static bool tcm_is_pr_enabled(struct target_opcode_descriptor *descr,
+			      struct se_cmd *cmd)
 {
 	struct se_device *dev = cmd->se_dev;
 
@@ -1793,7 +1797,9 @@ static struct target_opcode_descriptor tcm_opcode_pro_register_move = {
 	.enabled = tcm_is_pr_enabled,
 };
 
-static bool tcm_is_scsi2_reservations_enabled(struct se_cmd *cmd)
+static bool
+tcm_is_scsi2_reservations_enabled(struct target_opcode_descriptor *descr,
+				  struct se_cmd *cmd)
 {
 	struct se_device *dev = cmd->se_dev;
 
@@ -1854,7 +1860,8 @@ static struct target_opcode_descriptor tcm_opcode_inquiry = {
 		       0xff, SCSI_CONTROL_MASK},
 };
 
-static bool tcm_is_3pc_enabled(struct se_cmd *cmd)
+static bool tcm_is_3pc_enabled(struct target_opcode_descriptor *descr,
+			       struct se_cmd *cmd)
 {
 	struct se_device *dev = cmd->se_dev;
 
@@ -1915,8 +1922,8 @@ static struct target_opcode_descriptor tcm_opcode_report_target_pgs = {
 		       0xff, 0xff, 0x00, SCSI_CONTROL_MASK},
 };
 
-
-static bool spc_rsoc_enabled(struct se_cmd *cmd)
+static bool spc_rsoc_enabled(struct target_opcode_descriptor *descr,
+			     struct se_cmd *cmd)
 {
 	struct se_device *dev = cmd->se_dev;
 
@@ -1936,7 +1943,8 @@ static struct target_opcode_descriptor tcm_opcode_report_supp_opcodes = {
 	.enabled = spc_rsoc_enabled,
 };
 
-static bool tcm_is_set_tpg_enabled(struct se_cmd *cmd)
+static bool tcm_is_set_tpg_enabled(struct target_opcode_descriptor *descr,
+				   struct se_cmd *cmd)
 {
 	struct t10_alua_tg_pt_gp *l_tg_pt_gp;
 	struct se_lun *l_lun = cmd->se_lun;
@@ -2123,7 +2131,7 @@ spc_rsoc_get_descr(struct se_cmd *cmd, struct target_opcode_descriptor **opcode)
 			if (descr->serv_action_valid)
 				return TCM_INVALID_CDB_FIELD;
 
-			if (!descr->enabled || descr->enabled(cmd))
+			if (!descr->enabled || descr->enabled(descr, cmd))
 				*opcode = descr;
 			break;
 		case 0x2:
@@ -2137,7 +2145,8 @@ spc_rsoc_get_descr(struct se_cmd *cmd, struct target_opcode_descriptor **opcode)
 			 */
 			if (descr->serv_action_valid &&
 			    descr->service_action == requested_sa) {
-				if (!descr->enabled || descr->enabled(cmd))
+				if (!descr->enabled || descr->enabled(descr,
+								      cmd))
 					*opcode = descr;
 			} else if (!descr->serv_action_valid)
 				return TCM_INVALID_CDB_FIELD;
@@ -2150,7 +2159,8 @@ spc_rsoc_get_descr(struct se_cmd *cmd, struct target_opcode_descriptor **opcode)
 			 * be returned in the one_command parameter data format.
 			 */
 			if (descr->service_action == requested_sa)
-				if (!descr->enabled || descr->enabled(cmd))
+				if (!descr->enabled || descr->enabled(descr,
+								      cmd))
 					*opcode = descr;
 			break;
 		}
@@ -2207,7 +2217,7 @@ spc_emulate_report_supp_op_codes(struct se_cmd *cmd)
 
 		for (i = 0; i < ARRAY_SIZE(tcm_supported_opcodes); i++) {
 			descr = tcm_supported_opcodes[i];
-			if (descr->enabled && !descr->enabled(cmd))
+			if (descr->enabled && !descr->enabled(descr, cmd))
 				continue;
 
 			response_length += spc_rsoc_encode_command_descriptor(
diff --git a/include/target/target_core_base.h b/include/target/target_core_base.h
index 12c9ba16217e..04646b3dbf75 100644
--- a/include/target/target_core_base.h
+++ b/include/target/target_core_base.h
@@ -878,7 +878,8 @@ struct target_opcode_descriptor {
 	u8			specific_timeout;
 	u16			nominal_timeout;
 	u16			recommended_timeout;
-	bool			(*enabled)(struct se_cmd *cmd);
+	bool			(*enabled)(struct target_opcode_descriptor *descr,
+					   struct se_cmd *cmd);
 	void			(*update_usage_bits)(u8 *usage_bits,
 						     struct se_device *dev);
 	u8			usage_bits[];
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

