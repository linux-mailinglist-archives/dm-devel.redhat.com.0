Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDA525BB3B
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 08:48:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-Hx9wZqC9MqWhC-2HRMKYuw-1; Thu, 03 Sep 2020 02:48:56 -0400
X-MC-Unique: Hx9wZqC9MqWhC-2HRMKYuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BE5C81F010;
	Thu,  3 Sep 2020 06:48:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14F8281184;
	Thu,  3 Sep 2020 06:48:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C26DA181A06D;
	Thu,  3 Sep 2020 06:48:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0827OifS028011 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 03:24:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4C2072157F45; Wed,  2 Sep 2020 07:24:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 465FF2156A36
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:24:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CD8918AE947
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:24:44 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-300-PWPUazjgOliWnXZvyh7oSA-1; Wed, 02 Sep 2020 03:24:42 -0400
X-MC-Unique: PWPUazjgOliWnXZvyh7oSA-1
IronPort-SDR: Cwx4g1CTg2IeQchW+p8iZspbzLam5Ls2gDQoq+b33eWNErJBjSVJv+pYAz+JVNykTvC4gg5wcW
	QMS8zVPI6HP+C6s49YTpnAeWdnSD3/eM/AUFmdAmXCEP8lqmbYW2H5ckgX/hSYPiXyEWsaFviG
	+bjCbx2dYdpZpjZ3ms2pzKHY+0Y6fYm2lQ9No8N6ZNIKKOdFxiML0t4jBlGOuRXk08yQhK7K26
	FufD9jW2kiXPk7/DvrzWg/3vXKD4brLSHNXXEww+BDURGs2u1SMo4LqBfBH2fulBI3qesyLps6
	OYI=
X-IronPort-AV: E=Sophos;i="5.76,381,1592841600"; d="scan'208";a="255918296"
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
	by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2020 15:23:37 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB3966.namprd04.prod.outlook.com
	(2603:10b6:805:48::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15;
	Wed, 2 Sep 2020 07:23:36 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738%7]) with mapi id 15.20.3326.023;
	Wed, 2 Sep 2020 07:23:36 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 5/9] block: use revalidate_disk_size in
	set_capacity_revalidate_and_notify
Thread-Index: AQHWgHjE05l6FVr+70GNhORFziJQhA==
Date: Wed, 2 Sep 2020 07:23:36 +0000
Message-ID: <SN4PR0401MB35987F80C36AB409503DC0059B2F0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200901155748.2884-1-hch@lst.de>
	<20200901155748.2884-6-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1590:f101:bd07:d1f9:7e6b:2014]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6de1b2e0-f78c-452f-b4a5-08d84f111b69
x-ms-traffictypediagnostic: SN6PR04MB3966:
x-microsoft-antispam-prvs: <SN6PR04MB39668F869286235937E9DE549B2F0@SN6PR04MB3966.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lu4rznRnSXAWn/mRhvJdRylBVYy9k6gJLexdA2XG7czJBvRnncbiLSge2QR7Iw8nMyTzDthReYZBSyOiLKqK3CBLqn+YeUxZVg0UGM4pKJ/sKj9UQbwdYKajzH0fuYIet3fQRgP9CqqRonpkHi64nDnQGHdH+AQ7Jf8JArva3ApNf2HPLcehsQoy5FsmaJKdzCDQpsClP5m0WbC0sLQsCDOAVJ7s2V2WFiMcflJYSDXzARtU8wbvwO0DQBuCbViaPQK1B0Q8q6kXw+l2drbeahJtTzGPkLPNnnZ9bzBNJTRNSJUYiGk8mJTe3CovNBrQQVNx+n6LHzbiLOKzgBWKxA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(55016002)(4270600006)(8676002)(110136005)(54906003)(86362001)(8936002)(186003)(478600001)(2906002)(6506007)(19618925003)(7696005)(52536014)(316002)(558084003)(71200400001)(33656002)(66476007)(7416002)(66946007)(5660300002)(76116006)(9686003)(4326008)(66446008)(91956017)(66556008)(64756008);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 4+yMaX1z5FtIl8wxSD4U0mvnRUN8c3FW/o+aDrLkW+NY5j4rucRJ9VHZx72B/AVP0x5TanHtAVxI+lJkBsUdfX/EHKg2hyFaVEd9e3MQmsCRuwpXALo5/BvHzJ0ng+OnQ0iHcNkXxNVDfzGhnez0WoDF/NFVhk+hTfoF+eeehY0eZwaWl3awGYM4c6O+k9iQjJ0z+3lDlQJlJiEfP211c5XGdTskHdLzyLNxYeu580OGy2sYfH3ksK1hLXTxk8rbWdGusun3VtrwJBVwkJ6jr/KReNYVkiViQqPHvu/bsGJ6uKTkqab+CHsw//uHuQJcRLL6fBIIutY6TMjy7YB/27DGNNz25mb/O7hDU5zYqgL6fmGjJyIxAoPCPGrKPwSqYFyJxjnO4Iw4pVo05nGnCzP5r3B9c1x97wUtFdUVq8vp6Oo9rmkrJUzLh+rjGtK2rRpuGPUMIcfCFu9SfbJ1v02Vhmwmjjo9eXEFt93ildNGrc5PzmCR4IVGS72sCRem66g3JZpBuMlQfUZLv2okM34Pz313BYpb/DIU9fOKws7WZfpos3tci136D3hjpbq9kOZWONIaop8J4gQIW4MtFdT9XLudZY9NOKH0ck1+SDqALn1Qq74Ele9dBqbupIMBQVRRvBRoMjYprPW5HSDG0kTcIOsnHUsBovWyUip5XnGS1IIniOuaPZ2bADQYr7n8s2ZYv78qpRLxJXSIniNBnQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de1b2e0-f78c-452f-b4a5-08d84f111b69
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 07:23:36.4386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w1q8Bz+9jP6wkq7Rp1bTVJgrygj3CR45cOjuSlB7UWuFZC8p4T6RoR/BtLuEdd1cqIWUzyStoPvVm/saG9xrLhnutI9A4To9YD5ib2HncMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3966
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0827OifS028011
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 03 Sep 2020 02:48:19 -0400
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
Subject: Re: [dm-devel] [PATCH 5/9] block: use revalidate_disk_size in
 set_capacity_revalidate_and_notify
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
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

