Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 801631CD39F
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:19:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185140;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=CCLr4PI0J5g9qUYZMw4u+FHTKhkyeJWTKW5Kz44sqLs=;
	b=VgKQcWw1fhG3uOnZToFu7J/296tzV3peBvDBIl79Fifigu/zCe0Czcag4sq958RZjNt3gU
	BX9Sy88huGBgXRB4gZuc0ozslcQgI3UUPa91CIoD6Un2pgDDhHjSIz005qwLvrX1vEHQTr
	ipF676WBN+YyrVZ/4zZ33viozAgfYEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-sgQN37xwMsCH4TNw_D87jQ-1; Mon, 11 May 2020 04:18:58 -0400
X-MC-Unique: sgQN37xwMsCH4TNw_D87jQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3D2318FE861;
	Mon, 11 May 2020 08:18:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B892C5D9DD;
	Mon, 11 May 2020 08:18:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 652A14CAA8;
	Mon, 11 May 2020 08:18:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0481D515006713 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 21:13:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C818115144; Fri,  8 May 2020 01:13:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9788C115158
	for <dm-devel@redhat.com>; Fri,  8 May 2020 01:13:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98933811E77
	for <dm-devel@redhat.com>; Fri,  8 May 2020 01:13:02 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-354-poeRhDRpMOGxDNEGe6_dmQ-1; Thu, 07 May 2020 21:12:59 -0400
X-MC-Unique: poeRhDRpMOGxDNEGe6_dmQ-1
IronPort-SDR: RJsAGWJlugG0pU8OBUdZ/omeHnMctMMMz/OuSIXkxtDpKjzb7Ltob1K/aheJrc7+DDSTBWG4io
	Mp5GI251oZV7MvMcPX7jZlT7tSmxq9Q0oK2foBoE/mfYUOVQqv2wfxciR8V+HFGBFrWBy0rQjA
	E6C/TJZ0upcAwQ4eldbiUWodAAArYCMuFIMx3onOq6eb/2r1zZyZiNlGRfM32GSUzZ3HyihxM2
	is2DJkl7y/z3vyBAHIopOo8ZR8VmbZQ9Zq675CRB4FePc2iMP/nz5uCtR0H74i5ZJBHFJmj8U2
	+Os=
X-IronPort-AV: E=Sophos;i="5.73,365,1583164800"; d="scan'208";a="239832915"
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
	NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
	by ob1.hgst.iphmx.com with ESMTP; 08 May 2020 09:12:59 +0800
Received: from DM6PR04MB4972.namprd04.prod.outlook.com (2603:10b6:5:fc::10) by
	DM6PR04MB6091.namprd04.prod.outlook.com (2603:10b6:5:130::33) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2958.29; Fri, 8 May 2020 01:12:56 +0000
Received: from DM6PR04MB4972.namprd04.prod.outlook.com
	([fe80::6c49:dd56:97c3:3ae]) by DM6PR04MB4972.namprd04.prod.outlook.com
	([fe80::6c49:dd56:97c3:3ae%6]) with mapi id 15.20.2979.028;
	Fri, 8 May 2020 01:12:56 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Kjetil Orbekk <kj@orbekk.com>, Alasdair Kergon <agk@redhat.com>, Mike
	Snitzer <snitzer@redhat.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
Thread-Topic: [PATCH] dm: track io errors per mapped device
Thread-Index: AQHWJMQbT0aMuH2MDkOcDQCwLKYHBQ==
Date: Fri, 8 May 2020 01:12:56 +0000
Message-ID: <DM6PR04MB49726E28257263F5A1C643B386A20@DM6PR04MB4972.namprd04.prod.outlook.com>
References: <20200507230532.5733-1-kj@orbekk.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 566aba22-a9fa-4839-b1cd-08d7f2ecf0f2
x-ms-traffictypediagnostic: DM6PR04MB6091:
x-microsoft-antispam-prvs: <DM6PR04MB60914DFE9F25C5D994D914D986A20@DM6PR04MB6091.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 039735BC4E
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GjIIfAGC3DnGXMXHo14iXXoxMT/3xTP8NHyKj+7SeRLhQ0/+n+NSCFTT0aBuzB/fHS1Zxi814OMD7jo1ixek8Nzope7PAN5a834vW/7pegPWSN3GgwWGIfJLvvkfeSiJpLvswz2uBxI5G70bR7MhhnzE9mVx4fyRc7mFLaABHyDbW/pZtasQLLB+XAWbkexMUHH9USXMmkouhMEpTgyzrhAVMUrAfksi++Lh/3+aUEvUBOC5zRU9KaFeKWx7l6qBzNqgmyR9spEFg34MapZF1/4Lnm4wcJNgk3WOjVGzsN+q3K9yd3158GPDMrhUHBsTEzSJL1sACsjrNelrpKrdS3jULEVY5sNbbB9N2djKfSVTndxb8DWcOBLCZDdBVBgO2dFeabBgZ6sn383VHxV32uIg2UwculwsmqnDmhlx/ZeSG+u728eME7eRfInEAZXPbkiSRss+NFXibALuXWS28du5lkmOwfdiUoAngN3WLyIdTQcidhuVXFma5jkEbJJE5c6Aa7f/0fr1iRBhhwqZ+w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM6PR04MB4972.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(33430700001)(55016002)(186003)(6506007)(2906002)(66946007)(66556008)(52536014)(66476007)(66446008)(7696005)(64756008)(33656002)(4326008)(76116006)(86362001)(53546011)(8676002)(316002)(54906003)(5660300002)(91956017)(478600001)(9686003)(71200400001)(558084003)(33440700001)(83320400001)(83280400001)(26005)(83310400001)(83290400001)(83300400001)(110136005)(8936002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: +1o+BydoZpKX3H/k1lagZBFQ/Rkopo3ENU09dtuxOX0HfWT1+pzACholiqzO4k3AYQ1Eo8s6rRz/OnO0N8XP65MQnIye5xxlLvf+6phwL0oTza5RC2tG0gFFYONnaChLZGoAlGwN9neHSMMbKIW2GZChq+1SvJXy763M/ACBpyXLjKAwJ8Y2P89I0Esm2Bl2xXXDa9+Y/li6x5sRtUtt5Z/7Mgd4jJnNPJaLxfKiAI3/YgNm3Srwf/NgxRj0xLQ/Eus++fFthfUyw1y3gEKq1l4JVj4upFDEXrkZiRQGlLW4Ac2WTtnbN0Wxeb/VcGvRGRJ+lc9H/ImLTwPQszYCStqIZTVlBbGelisOid8BEAJpufw26PedpbEhju0jyJjaQLqYbfzeWE6wRCEG7QUPJ/f+l7OG/C4c6+7BjbMcPM32gztuNvCEKw1/jMk1lubwZ49GZYF5AptGpfHXyYm5+Nl1Cg3aw+DfyyxWGcX6LsZ7516a/nQ7Q/gwrENtg5vKpgbRYHWP4NouQKMOA3Haxcz8JkZSIwc/L0DCSUmVmqUDR0NFuv66YZrXsbyIEgNq7XkGurFLB1PhH6QuJFLb2xvv2NdDmSl6uGCPLi6aFMWK6i3H4mhRZi2fFGeJ0JPQZ/jBkTncuvhi2wRGV4jQ9J62VXpNthfxdM/wXOkelYKAFwgiHTR8CQCMx0G/C8VO7cSNpsa9j5PGbqfjBX/P76t5pz5+X/VBLTte5SZ0FZhmG1qPSFxGe3fmNuKSOIjWyJdH3kf0kOweU8TDJIyEP699LG2F26uugsBu9UR1Qi0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566aba22-a9fa-4839-b1cd-08d7f2ecf0f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2020 01:12:56.4295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fPxSK3z4kH4KJFSfP8BSJuNGIgMcCEo+iHQ7/jkvfRBZ/QzKm1Y0iYWTW+yShS87599B7kYyTjJkIwE3Emx07lYeXHPi8BMrke1WGyf3OsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6091
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0481D515006713
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 11 May 2020 04:18:30 -0400
Cc: "harshads@google.com" <harshads@google.com>,
	Khazhismel Kumykov <khazhy@google.com>
Subject: Re: [dm-devel] [PATCH] dm: track io errors per mapped device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 05/07/2020 04:06 PM, Kjetil Orbekk wrote:
> +		if (tio->error)
> +			atomic_inc(&md->ioerr_cnt);

Given that there are so many errors how would user know what
kind of error is generated and how many times?




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

