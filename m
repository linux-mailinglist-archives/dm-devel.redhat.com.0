Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF804F5A5C
	for <lists+dm-devel@lfdr.de>; Wed,  6 Apr 2022 11:58:59 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-wXCpoyuyOySgrvNNEWvcTA-1; Wed, 06 Apr 2022 05:58:55 -0400
X-MC-Unique: wXCpoyuyOySgrvNNEWvcTA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 651E618A6583;
	Wed,  6 Apr 2022 09:58:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E52DB401E16;
	Wed,  6 Apr 2022 09:58:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 19585193F6E6;
	Wed,  6 Apr 2022 09:58:52 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 06C69194036B
 for <dm-devel@listman.corp.redhat.com>; Wed,  6 Apr 2022 09:58:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E9FDA1415129; Wed,  6 Apr 2022 09:58:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E577A141512A
 for <dm-devel@redhat.com>; Wed,  6 Apr 2022 09:58:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC64E38035B2
 for <dm-devel@redhat.com>; Wed,  6 Apr 2022 09:58:50 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-EiWjH492NMKMpWuQ6Qfu3g-1; Wed, 06 Apr 2022 05:58:49 -0400
X-MC-Unique: EiWjH492NMKMpWuQ6Qfu3g-1
X-IronPort-AV: E=Sophos;i="5.90,239,1643644800"; d="scan'208";a="197229643"
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hgst.iphmx.com with ESMTP; 06 Apr 2022 17:58:45 +0800
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by DM6PR04MB6607.namprd04.prod.outlook.com (2603:10b6:5:209::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Wed, 6 Apr
 2022 09:58:44 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::a898:5c75:3097:52c2]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::a898:5c75:3097:52c2%3]) with mapi id 15.20.5144.022; Wed, 6 Apr 2022
 09:58:44 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 14/27] block: add a bdev_max_zone_append_sectors helper
Thread-Index: AQHYSZgY1jr1xIM/YUq07NGHawfBLw==
Date: Wed, 6 Apr 2022 09:58:44 +0000
Message-ID: <PH0PR04MB74161D2CCC5AD43AF09264799BE79@PH0PR04MB7416.namprd04.prod.outlook.com>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-15-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f6a7f3a-4bbd-4cc2-85a2-08da17b40972
x-ms-traffictypediagnostic: DM6PR04MB6607:EE_
x-microsoft-antispam-prvs: <DM6PR04MB660754EAC2F7575A81C46B4A9BE79@DM6PR04MB6607.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: Pf+KzgmagSIS5atE7qUNGRr1myBVVGSwEKyeGnwHdGjwF8GKBkvoIHDqMGnWFjO7XVa7Cmit9VnU9OIYztUkoZ6Oaqq+m+DiWH3/Dcl/UxK+P88E3f1isC2vpAnDpZpqgSoxQyKuSo19P3TzE/8glOLI6z0BLxqJa3LBIp+eJLbka+iU9uRCJGcYyq2EzzvF+GSwaV6/rfbL34RfHGjSRx0zwHlAe3Kbe4uou4XPkMqQqujVK+FspM3sA99WzgIx4Zcg+5oQR1jIyR4eA4XENp/K0m69Xx8aQEVd4C4NwBIAYB3DJbFAzY/xwFTEh8jZCLaKfZtso51HpFNskLoQWcTVyjcyZmpcj72RYBDj8bY8b+y0gW5f99u30BEwD03iXMk539DztkZxuC2HzN3BPR9e7KwNaRwwncQjXFedlJ7i/0TsMz5nf+dZ1/3hTsc6CrDt4p9WXnzuh263wo3xd8b6MW4eTv1TtLR3IzWdMRJG6cBeGO9RPQAMiItBrNypFxmRFeU4T1cp36pirzbw2w/ywCTEUkYc9uazSWAmIkbs2ELSVlHFGtwIR9gzIB7PlEGWJvLVp2CUKQFt3mcwlEIarIZ+6NjuqDOsMS6YGKX7bI/K6LKHavdoNguno7hvxdITrai2aC+YdO67pyr3n4smmpegwjXfnaI0Pmp9jFcUJll/tJASQJQReuEZSzAgzPzXDpY2hiiRf4a5gE9HNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4270600006)(9686003)(508600001)(186003)(6506007)(7696005)(2906002)(7416002)(5660300002)(55016003)(8936002)(54906003)(19618925003)(316002)(71200400001)(110136005)(66946007)(52536014)(91956017)(66476007)(66556008)(4326008)(8676002)(64756008)(66446008)(76116006)(122000001)(86362001)(558084003)(38100700002)(82960400001)(33656002)(38070700005);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FnQ2cDOI1Y8dqfwBZ9O49we2ex33sga4MDlqyPsi59CHLjzinNdqahxJKb+7?=
 =?us-ascii?Q?nLvA4glwLQWN5EGlwq9Vu5N+6RAHp5zPzMSHYKAI+ROqS5ObV22YE1uWhKPU?=
 =?us-ascii?Q?t/Slc0Vx6la1V2Ehl/8AFvAWHw7Kk3JevtOLqRNrLr0w3euyxPc4I6O7fPTQ?=
 =?us-ascii?Q?wLfN+Opb6mKJvfOq9BzXaoPuzM535gJJgXGiZQqr6/qzazXpx3T737nbJ/fT?=
 =?us-ascii?Q?5AYtInAAQcaVRXLBBJ6GN9tSCFD9aXABykDN429p4xlLfpuoDafHP6Jt5DbB?=
 =?us-ascii?Q?Iydzn9jRd0E0RXYdxFp2csxTMSqFiUWkGWouJQyBb2zUZOXn7G6VB6J4KuZp?=
 =?us-ascii?Q?fgPATSu1EoTsQYfHXonfg+YKrx8NlCxiY/WvDPDFylow6ArLN9X0TnmQSu+/?=
 =?us-ascii?Q?95IkUf/R+6oTU/6z37jGwKNh1BGImR8Z7zNd/uM1kkUQPDt6xtfwy79ITE6l?=
 =?us-ascii?Q?Q9xvZjwe1VhuWGzbavCQQVHCFV7hHqZE4hFqaAuJ/8loV7GxSt384nH03jh6?=
 =?us-ascii?Q?9hvUXSFWyQok4WycdVBAq2Pne6x63Kd/dzPArvViOJMCNXPPzMfEK2zH+VNk?=
 =?us-ascii?Q?3w+JAGP9eY7icR0QYXZpvCQn8jI2n5T3gvnfOW20uZaiR/w7EP9NAVWC238p?=
 =?us-ascii?Q?YyBdPiC0Py8H4BU3o6Exn/i3teu+O1s1FRXY9XsoYqSfv67wXY2BgOSNYQbS?=
 =?us-ascii?Q?A5HFhEpzP7fd8WRvXw6jIXWJduai4VwRFzBDYyAROlXlWkq4K5uZrnKpDVri?=
 =?us-ascii?Q?Lt5+iS19PHx7Rg1R4wXdhMzRCIjeeZd6PFaYSh3xZnuu+5Y/9ohSG9i7K502?=
 =?us-ascii?Q?1a/bzUyzkQNxTw1tQYH5EyiyC91aNMcH4nxXhtJ0Wedzj7mvIGc92lxOt5nE?=
 =?us-ascii?Q?JXxVC1uDiYmPEFzx4Y7D/dReZPhWqdc/jJdKt2W1YymXQazllgQwdagCnVsb?=
 =?us-ascii?Q?womFEzuPHfgISWVwI5IydynP4xWEHyHSeic/OWVf2vvnSOGfChy1xgRteWK8?=
 =?us-ascii?Q?O6lHklcYNZMBh105u3WOxpHTEenIZDxy4CJyZmOxjyHRyQ4/hAEahlgNd5T0?=
 =?us-ascii?Q?IIYsp55Li1hGb6kle+7E42lhFheoGmLSgVlPzJ2wViUr5JkB3zXPshZNHdCK?=
 =?us-ascii?Q?Drnr9ry+2eR2o1K0g1sZTYgaa453J2FLPb9EsxMmvl+A368fmvtLSJc6/GHO?=
 =?us-ascii?Q?kvIPug1OZFdbVSPQJnxaWdWK/ZgXRpNAH8KH2/la8sZCkHzfpGIcxpeAnxvp?=
 =?us-ascii?Q?Fu1KO8wFnzRvdlhTkpS+//xvC//Yvj9IUA7H47sdMX0MyyQstXAAASDIKQzq?=
 =?us-ascii?Q?4itpwg8G4I0h6hT1UWz/LYa9haG+XO08rx/HcQSRBLKhwhVFQQ/8TK7uDzGe?=
 =?us-ascii?Q?UrBw7s5v4mnnSjnPPV0U3E8GhTQO8/rq7n7rEAF9/BOb/A895TI4AENRfP2H?=
 =?us-ascii?Q?p0lPtXAfbYI2WYitkaAvMjep+iCpB8qGIW0MlNI4ahmo4gxlHF5/DOEVAML3?=
 =?us-ascii?Q?BsIhXDlHoRVG0p5dRxMkYVIPTIGR3tyHD8mDdRoSdVHc4PDkENOpi0vFrLjM?=
 =?us-ascii?Q?EsYFTB8/yWBXoKQrEy5lf4EqcvGyrksY/i+ncEk0C/qi0ucMo5O259xy4P5n?=
 =?us-ascii?Q?3OstWIQojxiCGjB3QzJ3ozRjmyPwY1cmzijUV+XzsMpKKikC4jRprDn5XJ3B?=
 =?us-ascii?Q?Z+ROJZpHXnIZCV41bUfdPSJQIk3jFqaSY3c3C5xSCmsfRuvM5N+mx+Qv0l5x?=
 =?us-ascii?Q?vgoI5NvxJ4DIaRE4F1vbqPEUlylYZ3nOFgGkB+69touDu3OoVoMGP2adpG05?=
x-ms-exchange-antispam-messagedata-1: pB0amHYuRq2xU5J1OT0zoHwBXpZuYFgg+OQ=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6a7f3a-4bbd-4cc2-85a2-08da17b40972
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 09:58:44.4524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cIO2gZbnUPowYwL5/+TFbMlM0mfXcWCM9eVRDLVDk37wzbnptzItElefyoFDRl92/LtkQZrZmaM/CVn+ZNQbb4SjElNyDclRC+u7dyWjvW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6607
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [dm-devel] [PATCH 14/27] block: add a
 bdev_max_zone_append_sectors helper
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
Cc: "jfs-discussion@lists.sourceforge.net"
 <jfs-discussion@lists.sourceforge.net>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

