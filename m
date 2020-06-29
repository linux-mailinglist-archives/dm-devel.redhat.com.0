Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 78C4D20D0E8
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 20:39:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-kGN2s96QOFKyiguasUihKw-1; Mon, 29 Jun 2020 14:39:39 -0400
X-MC-Unique: kGN2s96QOFKyiguasUihKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E96B804003;
	Mon, 29 Jun 2020 18:39:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B0359CFF1;
	Mon, 29 Jun 2020 18:39:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C4661809547;
	Mon, 29 Jun 2020 18:39:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05T9VvVs017188 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 05:31:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B8F812029F78; Mon, 29 Jun 2020 09:31:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B44C12029F72
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 09:31:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CB131859174
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 09:31:55 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-120-tLlE5nOxOCiMVLvrpKAYkA-1; Mon, 29 Jun 2020 05:31:52 -0400
X-MC-Unique: tLlE5nOxOCiMVLvrpKAYkA-1
IronPort-SDR: tAeOKkQlQ2lXTHrk/zkZK3t5fxmPuGbqgjhwweXhYkFlr4Z1jDuiOgbKc+6WXDfm7GIlLnRN1G
	A3EjvGyIoa+mbRJVk5KBLaZ7D0t87pYW9sBf9qpiPFsih2Zmuxt26UlF6ao2sPRybzSe2+vFcz
	oYGCYjzZikOc3dqBEBfXVNRqzRBPmO3XTH0OPHkIsRj8EC3GpMODqZxNUs53A9BitYsHdPdCFF
	C+NvJcGZp/ZrMhucKnOX8tTFM1kCdacx/+ZROBb+vHKOEmz4BMERAKvW+lyB92uxD/4M+9cUgu
	2dY=
X-IronPort-AV: E=Sophos;i="5.75,294,1589212800"; d="scan'208";a="142527849"
Received: from mail-sn1nam04lp2052.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.52])
	by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2020 17:31:51 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB4461.namprd04.prod.outlook.com
	(2603:10b6:805:ac::15) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20;
	Mon, 29 Jun 2020 09:31:48 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3131.026;
	Mon, 29 Jun 2020 09:31:48 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Tejun Heo
	<tj@kernel.org>
Thread-Topic: [PATCH 01/14] dm: use bio_uninit instead of bio_disassociate_blkg
Thread-Index: AQHWTFVNhEHhBYRZnECuJQ/imV0vWA==
Date: Mon, 29 Jun 2020 09:31:48 +0000
Message-ID: <SN4PR0401MB3598E2A437BF7D2E94A1D1C29B6E0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200627073159.2447325-1-hch@lst.de>
	<20200627073159.2447325-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1515:bd01:5d2:80d1:159b:260e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bcecde9b-0045-4786-4596-08d81c0f3f66
x-ms-traffictypediagnostic: SN6PR04MB4461:
x-microsoft-antispam-prvs: <SN6PR04MB4461F5165DDFE68C5AB69BCD9B6E0@SN6PR04MB4461.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TYDuIAQuhqe8397xiIBEQXtDjw/zkJbzbl0xJ86yJ4ff0RnVo4Dd5ah9Lv5qM0/OMYJCwv0gWgK9fnQOatoWNu/JVMEbJVQKo//QmZ1mNLaRjR9+kOV/z/vZH5oTzM4yDhbYYrxM92yvWYSM94pg9r0dQl2sFCHdL9RYHgFLIZJNnNqPWc+8idky+rBBy2aT98XUpoVde9SL4jCD+HmmnUMoocg1Q2bNdHDYUBsldgRL9ptaQemQwOnv3DusJYcAxTKMeBr6biCyBKtwoSoXojr5O39SfjSQvtY1lH3grmSKR40kDYR+Y5oVXw6b26QwCvtTgPB00IZ+cZql4E+2aQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(316002)(9686003)(7416002)(4326008)(33656002)(5660300002)(54906003)(110136005)(4270600006)(52536014)(71200400001)(8676002)(7696005)(478600001)(55016002)(19618925003)(6506007)(186003)(76116006)(66946007)(558084003)(2906002)(64756008)(66446008)(86362001)(91956017)(66556008)(8936002)(66476007);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: SRgU4yZreQpPfwnzKXBLkCL8ogPFvY+ZBNxfkIUcGRRhuQnXX51Ys3KbVWLyjz4GCHyB2gwXcoCmNMp2MuFFiiabw9hqAZokRuV76LEhbiH2mNdlPupaNCogq43TeK1/P1fZDPFuvrTS3Zm8hzJRRfrHPVhdz7vveRjy8j2xwHOS5doud9oXU4TyWwC0qUV3Yczty2N/0bMcviIFrtFKsQGEvXEFeD8y+hjh2BmpKFLSsudh8hCWRIcWgyaZKBIR7bX9sTsqL0TwUVlDxQN5J+VZXySSP1iT4IZemVfvbcuncOcco0p5sw/2gfBq4ThTl4xALn//13a69p/unY01CSzd7kJwHAWAV4bSdmkCEPpiHZFLJcNJlnBFqodLWL9xo2BV0mMqKVvMs4X267B4DOurHO48rl3tSZyOjcmECcyaLPWNZYytAKYklKX1IFY3iRlqGTWNTck6wnjtR3WUyyGM5KqYdo5R07fanmNH2Q1VxnFsmVR6mD4NiqXRxANS+p9l8ndB9pYs/r6Dp1NOmuZnwJ0pdLMYSe3QL/1rSG0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcecde9b-0045-4786-4596-08d81c0f3f66
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 09:31:48.5620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X7yey5SmTbVaZpKtYpXM1BxcDEzN8AxYLOHq1IZWa5RsdPoJmn9Qv53gK8AeMHzmehrs0OfXwymk+1f7mHyRWcifwer+a4L6UZemwIBd4A8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4461
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05T9VvVs017188
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 14:39:14 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Johannes, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Li Zefan <lizefan@huawei.com>, Weiner <hannes@cmpxchg.org>,
	Dennis Zhou <dennis@kernel.org>
Subject: Re: [dm-devel] [PATCH 01/14] dm: use bio_uninit instead of
	bio_disassociate_blkg
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

