Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 123F2368A79
	for <lists+dm-devel@lfdr.de>; Fri, 23 Apr 2021 03:42:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-2ogkROO1NnWL1coWRSwp4w-1; Thu, 22 Apr 2021 21:42:27 -0400
X-MC-Unique: 2ogkROO1NnWL1coWRSwp4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6289B343AA;
	Fri, 23 Apr 2021 01:42:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 679DA5C3E4;
	Fri, 23 Apr 2021 01:42:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5DE571806D0F;
	Fri, 23 Apr 2021 01:42:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13N1fqj4025570 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 22 Apr 2021 21:41:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E6E0B2207C0E; Fri, 23 Apr 2021 01:41:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFEAD2207C19
	for <dm-devel@redhat.com>; Fri, 23 Apr 2021 01:41:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68F1285A5AA
	for <dm-devel@redhat.com>; Fri, 23 Apr 2021 01:41:48 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-471-Y7R-_HSbOmSUEAx691fifQ-1; Thu, 22 Apr 2021 21:41:44 -0400
X-MC-Unique: Y7R-_HSbOmSUEAx691fifQ-1
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	13N1EJZf038678; Fri, 23 Apr 2021 01:40:09 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 37yveappry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Apr 2021 01:40:09 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	13N1ZsXW046296; Fri, 23 Apr 2021 01:40:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
	(mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by aserp3030.oracle.com with ESMTP id 383ccf29eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Apr 2021 01:40:08 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
	by PH0PR10MB4648.namprd10.prod.outlook.com (2603:10b6:510:30::5) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22;
	Fri, 23 Apr 2021 01:40:06 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
	([fe80::9ce3:6a25:939f:c688]) by
	PH0PR10MB4759.namprd10.prod.outlook.com
	([fe80::9ce3:6a25:939f:c688%4]) with mapi id 15.20.4065.023;
	Fri, 23 Apr 2021 01:40:06 +0000
To: Martin Wilck <martin.wilck@suse.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1im4dre94.fsf@ca-mkp.ca.oracle.com>
References: <c524ce68d9a9582732db8350f8a1def461a1a847.camel@suse.com>
	<yq135w4cam3.fsf@ca-mkp.ca.oracle.com>
	<06489ea37311fe7bf73b27a41b5209ee4cca85fe.camel@suse.com>
	<yq1pmynt6f6.fsf@ca-mkp.ca.oracle.com>
	<685c40341d2ddef2fe5a54dd656d10104b0c1bfa.camel@suse.com>
Date: Thu, 22 Apr 2021 21:40:03 -0400
In-Reply-To: <685c40341d2ddef2fe5a54dd656d10104b0c1bfa.camel@suse.com> (Martin
	Wilck's message of "Thu, 22 Apr 2021 09:07:15 +0000")
X-Originating-IP: [138.3.200.58]
X-ClientProxiedBy: BYAPR04CA0011.namprd04.prod.outlook.com
	(2603:10b6:a03:40::24) To PH0PR10MB4759.namprd10.prod.outlook.com
	(2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by
	BYAPR04CA0011.namprd04.prod.outlook.com (2603:10b6:a03:40::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20
	via Frontend Transport; Fri, 23 Apr 2021 01:40:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f086de7d-859e-4b4e-f485-08d905f8b8bf
X-MS-TrafficTypeDiagnostic: PH0PR10MB4648:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB464891F6175CFB06844BEC648E459@PH0PR10MB4648.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: vRBE36iDblf9aD5DC+oJyzkjPuan+euw+aR7g6iw9m8yuJyUsbPlNUJCEZNkRgCnDEy/sBQdlHFMnAcGpzlaoSjSEwdqIKOk87hcHyP8OLZPqV6mfy3m5wRdXQkDk7Nu8o0hitz7b3LteUf6HXXPjwXEKyl2WhoU0iEseXcnYxY7JwI/8aUY5KtWBs8JRk6kp32hEAiVUEP/x3MSZfC5GVUyzYhj2nvLgnm8LGHlpaVlb5WGvDpDvBzRNYeT8R1nUsUXuYkMPL1G2EIHMX9wIUmiqe8NZhvdqWR7umY27k2vtl5lE+Yq/ylLn6abKTZiie4R9KweD4Gmc5ME9mLXn35kIZQMnh5Oeia3ABSopfe/FkIJNQxKxEkn6dG1Hf7h22Q7FBSX/x03KJZVtvq9wdv7PfvpcUW/fR4Lk1watHT7uh8L0bqEoOHMHX5dE1re9ogxk6xjYPtGDrIRz3MidnBGGRkCyzvjnWCmmWHBEjNTRcjJEKi3IPISgs170deg12NqLIsMajwprVr1gnzgclqPRTh/a4/olZQHkLuOBPJJ/JutlJ5YirCE2cvr2gc6oLDUqihLBstbdAagiKBE+gKicbb/eOpFaOBr7krzSPUlRHrB9uG43ejrDB5Lp/VmoAHsQUD76i+dWhVsW6LwpDrBtqXYIu0Xbz1jZ3952nI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(376002)(396003)(136003)(346002)(39860400002)(186003)(86362001)(66556008)(66476007)(36916002)(38100700002)(6916009)(5660300002)(16526019)(2906002)(7696005)(55016002)(478600001)(66946007)(52116002)(8936002)(38350700002)(26005)(54906003)(956004)(83380400001)(316002)(8676002)(4326008);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?txnsT0D/J0bCdzh9rEfPaDun5xqaIIk1Z/M6dblEDo/BisGC8Ghf15MksjC1?=
	=?us-ascii?Q?/pKbQrK2Z0+a2Vc/+mNAk15FfKznkCRMfdYaEH+/99wR0+euPtztmC5pz/Zd?=
	=?us-ascii?Q?EYDX2rQlDGWzJ11LxEOZrC7/E7SjIp5eumIFYYIefdvf4562Uc8dYtv9tfRQ?=
	=?us-ascii?Q?PcT4QCjXjGTKdxjLQAURAixCO7T2HRczWfyfBwDiXqe8hx6RNjby8EDx+6Wn?=
	=?us-ascii?Q?lJoR7dk3u0psKH+6uUsDO+2hqOjkJ/8uBELVxvVrPDM53wTusjGFPdHaYMoy?=
	=?us-ascii?Q?w/WwpiDOwqpLjFHAMXIdWR0tQZX/ilSakHZoAPgjcJZebZfmo+rM2ue8r46L?=
	=?us-ascii?Q?azxDD10VPTlihtj6nPxLs5cho+dzmxqzTn33zZbvniG3FetrO9/+Seaql1ph?=
	=?us-ascii?Q?VAHAk6it0mrpNxowiILQwsuFlpENzKgBuA2eZ2Evj3JFucm2oLlfzTON+KRd?=
	=?us-ascii?Q?mLlVemwveFKH+aUoqL+zlP3WkJXT87Q0VGZZe1pjh80NdOmn/prygPrJBLxi?=
	=?us-ascii?Q?N1G/4nh5hF1rUgMrdS1C0Hrn9y9eLh22+gBqDrbaW8mglDQ9Qn3/r+rdhS7L?=
	=?us-ascii?Q?bZng3tuO7FLeXMqLfdG8Ozjt9h4HFSAwn+5DJ/oklG/jnQcksJLzxuOc9uLl?=
	=?us-ascii?Q?+v/xA7SWxu5fXx14nHcYDO7zTpDEQNKMgqz955G8l3z0BWyApQfJ9XEMCRH7?=
	=?us-ascii?Q?xSaXyJhjeOWjTGdSr5a98R0iZ+oRYKSB1svuNHTjjYmZ+cOj2MIL0JirRwgk?=
	=?us-ascii?Q?HgZLmWMAvb0JbQcpvnxg7/wj6WIKWRC1yhi486jWo9wrW9TRgxpetkpCpnnl?=
	=?us-ascii?Q?Fsvqn7JLwZ/Ajv0OjDQ6UkNERMJd7fPA1wcfkjWfOEnwv8ECCQzo7rj0sR65?=
	=?us-ascii?Q?1jynd8tWlT5JTVppiO8RfdwMBQVQju3ry1Yz5ipwaw7ukjz9ZYK1vF1+FsNx?=
	=?us-ascii?Q?vURco1gmOcVrXW8lEywvA3wXW+nW7Jj6yCn7uucZPHHMICKyGXSA8SwaiYoE?=
	=?us-ascii?Q?002UmpDvTDy/kUTHOHNv4SOxHdZ8m6WR1nM3tigeO2GqK93M3QvniZNWHxWJ?=
	=?us-ascii?Q?B3uFFArx4/bdRzhLc4oowIw6Z0WsepRI76OSpGCOmX6/i+vPkAI/ZoPard8G?=
	=?us-ascii?Q?Mb/Anc4Wkz7DPy76G4ftQKKareCbJnX+hikwrKaRVPV2Q3pa9GwEJJg/W4rF?=
	=?us-ascii?Q?sdlV/2SSxTUulUXiQSQjovpAhTqRBm8MhgCAowEm3UkmtBybTbtOTi+CRV09?=
	=?us-ascii?Q?ux2lezMn6E86RzYRzmfg3i863ilG02iPZ0nEYw+G8UxG23xjugQ+vhJAv8J/?=
	=?us-ascii?Q?Q11MyE75m7147PIXIxDFW7WD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f086de7d-859e-4b4e-f485-08d905f8b8bf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 01:40:06.0954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9JWPqCxrOTOSMcWEf6nkxv6BC1lEKNhmw6/QR/3FNQVx2I9CQwMBRHTcud/9atOh2V5ic9Rm+leV8YBdfFhNPJsAHCqLn//Dc3Uzw5Rquc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4648
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9962
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
	spamscore=0 suspectscore=0
	mlxscore=0 phishscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104060000 definitions=main-2104230008
X-Proofpoint-GUID: 4ILNEYisfW68wD4w-x0RvINi1Y3F8R4d
X-Proofpoint-ORIG-GUID: 4ILNEYisfW68wD4w-x0RvINi1Y3F8R4d
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9962
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
	phishscore=0 mlxscore=0
	suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
	bulkscore=0
	adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104060000 definitions=main-2104230005
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Reinecke <hare@suse.com>,
	"jejb@linux.vnet.ibm.com" <jejb@linux.vnet.ibm.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	Hannes, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"dgilbert@interlog.com" <dgilbert@interlog.com>,
	"systemd-devel@lists.freedesktop.org"
	<systemd-devel@lists.freedesktop.org>, "hch@lst.de" <hch@lst.de>
Subject: Re: [dm-devel] RFC: one more time: SCSI device identification
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Martin,

> I suppose 99.9% of users never bother with customizing the udev rules.

Except for the other 99.9%, perhaps? :) We definitely have many users
that tweak udev storage rules for a variety of reasons. Including being
able to use RII for LUN naming purposes.

> But we can actually combine both approaches. If "wwid" yields a good
> value most of the time (which is true IMO), we could make user space
> rely on it by default, and make it possible to set an udev property
> (e.g. ENV{ID_LEGACY}="1") to tell udev rules to determine WWID
> differently. User-space apps like multipath could check the ID_LEGACY
> property to determine whether or not reading the "wwid" attribute would
> be consistent with udev. That would simplify matters a lot for us (Ben,
> do you agree?), without the need of adding endless BLIST entries.

That's fine with me.

> AFAICT, no major distribution uses "wwid" for this purpose (yet).

We definitely have users that currently rely on wwid, although probably
not through standard distro scripts.

> In a recent discussion with Hannes, the idea came up that the priority
> of "SCSI name string" designators should actually depend on their
> subtype. "naa." name strings should map to the respective NAA
> descriptors, and "eui.", likewise (only "iqn." descriptors have no
> binary counterpart; we thought they should rather be put below NAA,
> prio-wise).

I like what NVMe did wrt. to exporting eui, nguid, uuid separately from
the best-effort wwid. That's why I suggested separate sysfs files for
the various page 0x83 descriptors. I like the idea of being able to
explicitly ask for an eui if that's what I need. But that appears to be
somewhat orthogonal to your request.

> I wonder if you'd agree with a change made that way for "wwid". I
> suppose you don't. I'd then propose to add a new attribute following
> this logic. It could simply be an additional attribute with a different
> name. Or this new attribute could be a property of the block device
> rather than the SCSI device, like NVMe does it
> (/sys/block/nvme0n2/wwid).

That's fine. I am not a big fan of the idea that block/foo/wwid and
block/foo/device/wwid could end up being different. But I do think that
from a userland tooling perspective the consistency with NVMe is more
important.

-- 
Martin K. Petersen	Oracle Linux Engineering

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

