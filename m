Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A8F3125A685
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 09:24:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-aRcfzYcCPzCC-zOsJ5Xt_Q-1; Wed, 02 Sep 2020 03:24:16 -0400
X-MC-Unique: aRcfzYcCPzCC-zOsJ5Xt_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBBF01074646;
	Wed,  2 Sep 2020 07:24:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7C405C1BB;
	Wed,  2 Sep 2020 07:24:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DAD179A32;
	Wed,  2 Sep 2020 07:24:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0827O7gL027890 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 03:24:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB3FEC54B1; Wed,  2 Sep 2020 07:24:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E485CC2241
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:24:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC553101A568
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:24:06 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-22-BgsgYVzePvWrcEVpMUP9xg-1; Wed, 02 Sep 2020 03:24:05 -0400
X-MC-Unique: BgsgYVzePvWrcEVpMUP9xg-1
IronPort-SDR: 8nWJf5SKzh8l9jS3ehtfpt7qELFN9lGt3DUlabayDEiV7d6jkRdgNIopMBgMr9sdz8cM/K07Y9
	uLrLMolEgdhkfZ691cExFmbhYiKizx7EeDLVCPVj8DpMBj+tuOTRvsb4v1rMzrjEcrrkSN62cG
	PS9Gt1nlf/m3vCmoQaNLHmYBpUukHZ1CFFR/CXrDy2TzbanWuYT+hoI0weDL6nkH0RygZ4mv/7
	jho4JKUtP8x/mhAP0dqtiUeKNWHxPOHLUxNfzQFcUzaBVBoSIrIvMD8s/zAVD+D6Wa9W0vF999
	SP0=
X-IronPort-AV: E=Sophos;i="5.76,381,1592841600"; d="scan'208";a="255918246"
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
	by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2020 15:23:00 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB3966.namprd04.prod.outlook.com
	(2603:10b6:805:48::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15;
	Wed, 2 Sep 2020 07:22:58 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738%7]) with mapi id 15.20.3326.023;
	Wed, 2 Sep 2020 07:22:58 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 1/9] Documentation/filesystems/locking.rst: remove an
	incorrect sentence
Thread-Index: AQHWgHk2yUPrhJYVhEiAKhnkiuzfng==
Date: Wed, 2 Sep 2020 07:22:57 +0000
Message-ID: <SN4PR0401MB35982F6AAAA2FD65805726B89B2F0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200901155748.2884-1-hch@lst.de>
	<20200901155748.2884-2-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1590:f101:bd07:d1f9:7e6b:2014]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f6fe0160-fb24-4df5-d73c-08d84f110479
x-ms-traffictypediagnostic: SN6PR04MB3966:
x-microsoft-antispam-prvs: <SN6PR04MB39668A5BDE006F6C8DDE92FD9B2F0@SN6PR04MB3966.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yXAA4NG4OnO2CxpBkCQnV0qMiAsX4lYp4Ohnka8pqakaxTQlaHHASCmBpD1W4ZOBCaXUJ9/q/bT8moK1oXWTGPEKyMHbqwr/1wFZ/+FVxvPz4Qqp666p5onQ0jM5ZEhM2cqeiRwwW3WFLmpPSHgyxi3fu9KPc5j8NRia+7+ILkw/QMzXtmiLiO8Ikb7rK0sDDfCo+Ng7GLptStcMvf2eCV7NvoyeuwgqlaLw7oujjcC5k3UuA2LfBbxy8wQn7ZZLN8MCwEbetm0k4+UH2ml80G2cZM3HnALPrmk/1XbWbybldF7LvHw9bt1kkjCmoHJGTBFtjplyKui/MFio3pazsw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(55016002)(4270600006)(8676002)(110136005)(54906003)(86362001)(8936002)(186003)(478600001)(2906002)(6506007)(19618925003)(7696005)(52536014)(316002)(558084003)(71200400001)(33656002)(66476007)(7416002)(66946007)(5660300002)(76116006)(9686003)(4326008)(66446008)(91956017)(66556008)(64756008);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: FMWry4X3+TGbiY7HMQcyLdod4gQDB1ohRRBhbFcRSGf4oc6j26Fbvue/rn9K4gOvNzl76QTBo3wfwijRq13GY2XpKRDmIj2XJVrvU2oLpOYAldRb+NgOJBWxn+O3w4aIo/CG8Lno1V63u1kzDH4Hu4Lq5HkCc/Nbqkye152e3upcYSJiiYrvGZIgS+TX9m60+BVxbok9cyCGJOU5V7B0gfV0FqKN25gRyMHNB2SjVtEk4dpQkTmzl89MYOh/5aMQ0cYpJeG8AgsGyCCimRru/NbYMA5+Ynvvzkb8ndXlGsNB8KgcJXneNxDVyvIdxMdwgLLRQjfKSPcLASFQIuY0et7TCl0lBXk9ZldxQHaYDDBb7HvKEwNX5MJ7XbCj8dIDj38ISY9jmFicNiW6tereeCCKP+TrxPnwpz9iu54SsbD+pESFSU7oWqK3p8safrRl3He6Sf2nT0og5iZMF8zB7X/4CFfgrxvggQr9td/yK2IHfv5WYpnGGwcoefbW2voWcpUEiYPX72GDHjLc50q9EI/yO1Lh5I+hR3xGmqWRTSkRprVkXQVttGOtpWrwUDJzvn7/nWRtr3HSVCaYbnKBZdCGr/l5VgWJvhbeQeXguaA4RoIMp8jyXISROgui+J2nNXYrwVESqL8tCnPKG+yRWde0VWgQou01FFr04jlT1q1Fw0af5ZLeybSJpwUFBXszcpf5EkO1zYI9xMmVsVGUyQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fe0160-fb24-4df5-d73c-08d84f110479
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 07:22:57.9888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eI/r09PRmTG2+R/2Y67jd0XJyE4UBekRTypOsW7IgDRvPbIROAl8mibw152ovfpmVPF4yH29JF6oW33+eR2YPrxjuVbM2AB75nJUArOa9+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3966
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0827O7gL027890
X-loop: dm-devel@redhat.com
Cc: "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Josef Bacik <josef@toxicpanda.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	"nbd@other.debian.org" <nbd@other.debian.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH 1/9] Documentation/filesystems/locking.rst:
 remove an incorrect sentence
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

