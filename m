Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id AC4C220D0ED
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 20:39:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-PaqvFBNOPDSnPAaXJkAPpg-1; Mon, 29 Jun 2020 14:39:44 -0400
X-MC-Unique: PaqvFBNOPDSnPAaXJkAPpg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB4B91054F9C;
	Mon, 29 Jun 2020 18:39:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA0A89CFF4;
	Mon, 29 Jun 2020 18:39:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 750478789D;
	Mon, 29 Jun 2020 18:39:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05T9topu018731 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 05:55:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 128E72156A4F; Mon, 29 Jun 2020 09:55:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D5672156A4A
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 09:55:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10DCE858EE2
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 09:55:48 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-374-ruu5OFGuOQaUbWD7o8Opmg-1; Mon, 29 Jun 2020 05:55:46 -0400
X-MC-Unique: ruu5OFGuOQaUbWD7o8Opmg-1
IronPort-SDR: 6QwyszSzftixHlCSPXslHC6+OCpaMmQI4dKvWoBptKENRjhXZPofM1xmRVXWp3kC97P773fhVx
	otVULSI6wDcNSySYKAfBsphgkaT6aM0eOkVLPTrfX1tfeejVMUojqzM/8VZINEYiCtxzsE2vAM
	Hv7/6ZvUGtJx8icXy6jOAY0h4mtZ3iDhyznmk6NXDXqbrC0hrMrxeJMHtGNX7eWeG6xNxxF/Sa
	FoGmNuUEk2UALuhoSUJagqmdlmDabJ37nPGszt+QSaYCpLUXoc9W1WAZXOBGEd0vrJT2//GiJv
	6fE=
X-IronPort-AV: E=Sophos;i="5.75,294,1589212800"; d="scan'208";a="141385251"
Received: from mail-co1nam04lp2057.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.57])
	by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2020 17:55:35 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN2PR04MB2318.namprd04.prod.outlook.com
	(2603:10b6:804:17::9) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20;
	Mon, 29 Jun 2020 09:55:31 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3131.026;
	Mon, 29 Jun 2020 09:55:31 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Tejun Heo
	<tj@kernel.org>
Thread-Topic: [PATCH 04/14] block: merge __bio_associate_blkg into
	bio_associate_blkg_from_css
Thread-Index: AQHWTFVJUHZDzJChU0uNuEC9eMoBSA==
Date: Mon, 29 Jun 2020 09:55:31 +0000
Message-ID: <SN4PR0401MB3598E2832843F2BDD9C201D39B6E0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200627073159.2447325-1-hch@lst.de>
	<20200627073159.2447325-5-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1515:bd01:5d2:80d1:159b:260e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 579b60d1-01ef-471e-221f-08d81c128fb0
x-ms-traffictypediagnostic: SN2PR04MB2318:
x-microsoft-antispam-prvs: <SN2PR04MB23183060DF309ACC2FF2FA0A9B6E0@SN2PR04MB2318.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sNe3F8Rp/+OUn0YmnuUVIuDp6hFrw9SNICrnkKA0kSm0o2zurxMx/hf6VNmjbK/jwrd9eiT6klUf6Vsm/c3enez5plyfLrvm0tu47dHdLKwrXnEGeURlsTBccJ+Rsw7llK9ei6NxVCCvUWRgG2bxrgLP8iG/K5gBV4gdOZsDD1O75PChF0nwrcG4EE1OW1NyIx+hanmBEug10vvA7yHeetiXhQQYHjPZBAf+ch8BWKDIq2Sabq4p3yh1WOFB44THPsRHem/S26fa6Tjc/iqU/GfROm3jZ0r56J7VVbY3vKnB8m1HYh6t2MOwI16THnz8GdGNRSePQoMxM7qCHL5ArQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(478600001)(19618925003)(8676002)(52536014)(71200400001)(7696005)(558084003)(2906002)(66946007)(8936002)(64756008)(66556008)(66476007)(66446008)(86362001)(91956017)(6506007)(186003)(76116006)(55016002)(33656002)(4326008)(316002)(9686003)(7416002)(4270600006)(5660300002)(54906003)(110136005);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: eKmdBN50K9Q+hkV72BAjelhxfuvInTi71ui7eJYdx9ogxZ7o6snRgGtSq/wdAkeHhM80vd75Go5GZ/amhplq0H3NOK5Ee/QTMq4kirKE5NVlS/3J01zSo3FgPNi8mb8y9rb3fa+0UzUimv4TK9IVdIfrjaPrqUVpRZT0QWfX93+Sn7+o8aTj5mHe/tiRzrEWCkrIXztCUAIw0O+ZCLZG6nun+Fl+IR/FTYg+Y2aaxS55yGPekCcam0PErWv+cCLVlVX3v/07CCbvc7ILp0Dj7mMpPFvHP5rul20Q/I/vqYNKMmFlvNOQEmSOk1dO2R+6UwI42CkcSBrJ3PLJN7ss9xgtyKCjbEulImcRQ08ujIGUvCT517adqtDH2E/T5l97VQKQ7skJxHzSRafnqK4Y05WjHlwgHBdx+NdtmwvVh15Spc0yX9GyU/CjhSTocE5kxW9hqKme3jsq/LV6D8TTa9rcXfPW0WbpdN6YPkhy8rEP0PQy8EG8F8+EHa5ubFj8fJXcDH3dI/Lstngn7th8m9EOWiw5HZT1EH46gjS4EixGV3aa9d1ckre1BuxRpS3d
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579b60d1-01ef-471e-221f-08d81c128fb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 09:55:31.7489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qtZsD2RjXuU4IftaIh1d5NcbsLbckewsbUCAsR4kSfXm5Mo+1Oqi9M7jHunSS4up4YqK8ye4aBgn4mwerKQaXMmdSetYAprffJ4qkGFz/4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR04MB2318
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05T9topu018731
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 14:39:14 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Johannes, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Li Zefan <lizefan@huawei.com>, Weiner <hannes@cmpxchg.org>,
	Dennis Zhou <dennis@kernel.org>
Subject: Re: [dm-devel] [PATCH 04/14] block: merge __bio_associate_blkg into
 bio_associate_blkg_from_css
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

