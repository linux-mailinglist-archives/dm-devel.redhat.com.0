Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 42D4820D0E9
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 20:39:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-MFnjp2ZoPHSYnfw_F0ltEg-1; Mon, 29 Jun 2020 14:39:39 -0400
X-MC-Unique: MFnjp2ZoPHSYnfw_F0ltEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D5A41054F90;
	Mon, 29 Jun 2020 18:39:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D784760C80;
	Mon, 29 Jun 2020 18:39:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C4518789C;
	Mon, 29 Jun 2020 18:39:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05T86J9U007782 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 04:06:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D2A762017F0E; Mon, 29 Jun 2020 08:06:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD7A520267F2
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 08:06:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C606185A797
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 08:06:17 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-423-TyiIlPUQPrC9FaLiNvGe4A-1; Mon, 29 Jun 2020 04:06:15 -0400
X-MC-Unique: TyiIlPUQPrC9FaLiNvGe4A-1
IronPort-SDR: guItr0tdOhbzWYn71HMAJknGWcKdvKyoGK/n8E16jMllqaFsQracCFdv14OOAMQ1vPYS94Y9sC
	GQ5fimlQmJfOnWHrjvzBQ/4+uJovWQlUddvwdPf9KPEv4VqdqiZnlmUGR8ndY8OXvYoikvkYuO
	c0TLT366VEqfivsfZoaie7jIXSnTfxlKnKsEerEpS83n0OgN4hb3ywOUz/GoUeopMYQwOlECv0
	yDbD+yEVPXHjkH3t3DbpwKPl058OqGe+3LyZ9Vj0+doZYewNJYF9hbKt34YRBMNizmk6rWXXUM
	piI=
X-IronPort-AV: E=Sophos;i="5.75,294,1589212800"; d="scan'208";a="142522030"
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
	by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2020 16:05:09 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB4543.namprd04.prod.outlook.com
	(2603:10b6:805:a5::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20;
	Mon, 29 Jun 2020 08:05:07 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3131.026;
	Mon, 29 Jun 2020 08:05:07 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Tejun Heo
	<tj@kernel.org>
Thread-Topic: drive-by blk-cgroup cleanups
Thread-Index: AQHWTFVNUm1R45WD7UqFEU0lzIn8zQ==
Date: Mon, 29 Jun 2020 08:05:07 +0000
Message-ID: <SN4PR0401MB3598A198ACA6126D96E949B59B6E0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200627073159.2447325-1-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1515:bd01:5d2:80d1:159b:260e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8b954eda-16d9-4b32-f514-08d81c032314
x-ms-traffictypediagnostic: SN6PR04MB4543:
x-microsoft-antispam-prvs: <SN6PR04MB4543D6D08D25104EB56280919B6E0@SN6PR04MB4543.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xBtHp69HFt5t5P6wMyVoqOCIxVMhWHBWlj3FNyIjXtM9up73OGB1Nzzt/RNwFcp2wcNaHjuCieX/7s1cRNYVUVzZsntlNyQsAOckauH5mfTNpJiYFVyfFa4u8z4R4AqcN/+ALBxCSNYV2gtQ4sQDoTJcmlk4MtmRGnQqHwPam9NxTOTdCw/+MgJX4/R+DaozX2W+qRAKu8XB+CzdMo28jmcWmxpRsIF4wkCp6gq9kcpuZBEfWmyLMLpTl5N338SpbqYKTNSB2vh5h/g8vIYb352/u34ojKnuBrr7ybDYL6oqt5n/CHhyrk9UZmdUr7ukK3nFTaConMRq3CtQ5hlwPvl5xHXdxOQ/1bXZGJQXfwWTIixl+bUF2KpmKrxZeNYiYGdssOzpgEo2NQcnGy0eKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(3480700007)(186003)(966005)(71200400001)(66476007)(7416002)(66946007)(91956017)(110136005)(76116006)(83380400001)(66446008)(64756008)(66556008)(8676002)(52536014)(478600001)(5660300002)(316002)(86362001)(33656002)(55016002)(4326008)(2906002)(8936002)(7696005)(54906003)(53546011)(6506007)(9686003)(4744005);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 7KYnjZLq0IBsQAXlYk9BeKhOMIXLCbQ0GDojzQ3lz+2jAP2pYMGoUzpyVn+kDub8BVWvzK/rlTR4BK4r485v8Lm9MrnewmgaZisBdWVhKjWvAtUzvYno5bsIaVkYYgzgfMcLdTc9u1IoZjFQm4Z9BlAnMBGyp2A37iCCgplShNQJ/3wSyXDnIXNb/IjJPdibs1KbHPqSA+VhmzOV1smDAWQl9q2bW9FM8j2aGQWSrQfqPa6G9SJdunMpQufBi6rmSWV9FRhvdVvJHUsSZUQyHw/V6DZ4KT/QN2Ysv3e0eYeYBadnR7RzhwTHhMQ1n8MMCAsgwBzB2cvh3/+4eodFk1rSZ6F/awI78G2f4Hg8EESFOCHUiXn/kMR0XKUKV3G/Xxbdq/CNau5IZdVA61wLlwvndL3mskVyEQu/hZCvTR8lWqW4kfA9GWbofQD+MjDeg6TP88RZfEcfuZam2dhc/HONk7uKgHxUC1rsuHmKdwV3B805iPkPMTXilAxhG9NeZcLVAn9rkjQ2Fh/ealCg2NHiQSp3q4qdLx8hEZZBBhw=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b954eda-16d9-4b32-f514-08d81c032314
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 08:05:07.0401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qxsMyNQWQSSYwSeXGlGvUOzxeP4WOaoaSIWIDpwwMmIZm0QbPEkvYRt/dNwOy8lydGK1JcSaBJCIMGYl12vhjt+ngJ0Rct7V9CruZQWIVpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4543
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05T86J9U007782
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 14:39:14 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Johannes, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Li Zefan <lizefan@huawei.com>, Weiner <hannes@cmpxchg.org>,
	Dennis Zhou <dennis@kernel.org>
Subject: Re: [dm-devel] drive-by blk-cgroup cleanups
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 27/06/2020 09:33, Christoph Hellwig wrote:
> Hi all,
> 
> while looking into another "project" I ended up wading through the
> blkcq code for research and found a bunch of lose ends.  So here is
> a bunch of drive-by cleanups for the code.
> 
> Diffstat:
>  block/bio.c                |  143 +----------------------------------
>  block/blk-cgroup.c         |  182 +++++++++++++++++++++++++++++++++++++--------
>  block/blk-core.c           |    7 +
>  block/blk-throttle.c       |   10 +-
>  block/blk.h                |    2 
>  drivers/md/dm.c            |    5 -
>  include/linux/bio.h        |    9 --
>  include/linux/blk-cgroup.h |  101 ------------------------
>  kernel/cgroup/rstat.c      |    1 
>  mm/page_io.c               |   17 ++++
>  10 files changed, 192 insertions(+), 285 deletions(-)
> 

Btw what ever happened to https://lore.kernel.org/r/20200430150356.35691-1-johannes.thumshirn@wdc.com?



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

