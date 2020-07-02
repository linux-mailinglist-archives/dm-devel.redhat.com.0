Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C3FAD212789
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 17:15:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-bx3QuXhkNKiyo5vX-vJ6aA-1; Thu, 02 Jul 2020 11:15:47 -0400
X-MC-Unique: bx3QuXhkNKiyo5vX-vJ6aA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BB3F8CA883;
	Thu,  2 Jul 2020 15:15:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 466F873FF7;
	Thu,  2 Jul 2020 15:15:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C560D6C9C4;
	Thu,  2 Jul 2020 15:15:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062FD9Ft016040 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 11:13:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 85EE92144B5F; Thu,  2 Jul 2020 15:13:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 553262144B5B
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 15:13:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABE278008A5
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 15:13:04 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [51.163.158.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-485-IpDo9drDPOaaOhyTt9sx4g-1;
	Thu, 02 Jul 2020 11:13:02 -0400
X-MC-Unique: IpDo9drDPOaaOhyTt9sx4g-1
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-15-zYLsYrJBPlORmk0bhZphBQ-1; Thu, 02 Jul 2020 17:13:00 +0200
X-MC-Unique: zYLsYrJBPlORmk0bhZphBQ-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR0402MB2919.eurprd04.prod.outlook.com (2603:10a6:4:9b::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21;
	Thu, 2 Jul 2020 15:12:58 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3131.035;
	Thu, 2 Jul 2020 15:12:58 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 3/4] kpartx: handle alternate bsd disklabel location
Thread-Index: AQHWT/iJ4r6zVklgvkShWUgy6pCAeqj0ZpYA
Date: Thu, 2 Jul 2020 15:12:58 +0000
Message-ID: <42e56b533d5f87dd8ba4f14351d5aeb3a5b4a7f2.camel@suse.com>
References: <1593643176-6206-1-git-send-email-bmarzins@redhat.com>
	<1593643176-6206-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593643176-6206-4-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1c030f6-3907-4e49-a341-08d81e9a6779
x-ms-traffictypediagnostic: DB6PR0402MB2919:
x-microsoft-antispam-prvs: <DB6PR0402MB2919B97143552BD727D2E3E5FC6D0@DB6PR0402MB2919.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qSg5CnSkRbgAsOQ8waFiDXH/sKKbOliAMzTlFGTbjAXwz+Mxg+QcQkrhI/diBNYjwvrYsfVzNXmMW7mqj2DkbY9B/EZF85d8qMGD96kvxDhFNhFLFOMN5yAucXLJtsb0rVDSHImGV6la7Tv4RXKcLYuunetAU4WlOl1XquGfaPu8HUs07jWcEMtk8IiF3xUkKsTLScdt75dJ05gviip0InbWcsRgHi8Z7vfjoFVD0q001hGxlyf8mHXJ3v8fCqlkRhfhVdEbO0Fnwcf3IlES8EQ0aaYCMZEzCT+8DmMdLqyk0G6l44XLCoCtuzYDZP9LS1aA+pVwx99yDmtEGcBCQCEcuKgXYAqQMgwoI3syIetGLP5cyAOd/SH/q8Fj8xrUemsZq2f/JhElfyFM6vEjfA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(366004)(26005)(66556008)(66476007)(66446008)(91956017)(64756008)(5660300002)(186003)(6512007)(2616005)(2906002)(66946007)(76116006)(36756003)(498600001)(83380400001)(4744005)(8676002)(4326008)(8936002)(6486002)(86362001)(6506007)(110136005)(71200400001);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: W0LR1w5LtuhMl3L2nPzj7JjoeL5FcdRkd+rYMmBobzlvMqmVOrsaUg+GoOOWjD+FiEPCyTflqoU+KMnvotzWrjH6rePztA/2pko2J3fVZJ9SNF5GAUE6PfcdutLE17qqFDyl3XJWLvCS7k0DblZsWRyFBRNLC4r2BQ/jTHMLEFAwQzWtC+InQd/buLBzMlAZVTwagzN0Z86f4XitgNQ3LtlLPK1b+BBQd3rUgMDHUmxLxqoekTU1VBlzhVFjk6SsancOjvtC0QTolHkzv8Mw7GfTkOAadSOAYMucZjI9MsbSf07KDkKnUAivtNZloNiAUnymBTMM063qXz1x2OzqE51ex46WnhJEAC6LmCJgkSsBMdhzOqdYsRePRKZhPhAZYbj6feX8cjXwUNad4vzXBTOCdboYtKovntxWTASy2JqDILbpw60NAddJ4bk+fKKxWsx2WxgGLnpzxD8F5joykp3c36qWZiVhrTAn5C+/KK9l9BRbJ4tZxckmQfNbL5oU
x-ms-exchange-transport-forked: True
Content-ID: <EEC56CB567200A43B0D5894B563CD96B@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c030f6-3907-4e49-a341-08d81e9a6779
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 15:12:58.0997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2EKJ+6bZ8oe1P0H56Zovbq+n5i6UVt4w9lTV0uJs20bZe2mNzJw/Rh6Rq2SN+4mXts84XAkzmjvPqbUQi+lGtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2919
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 062FD9Ft016040
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/4] kpartx: handle alternate bsd disklabel
	location
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-07-01 at 17:39 -0500, Benjamin Marzinski wrote:
> bsd disk labels can either be at the start of the second sector, or
> 64
> bytes into the first sector, but kpartx only handled the first case.
> However the second case is what parted creates, and what the linux
> kernel partition code expects.  kpartx should handle both cases.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

I can see that for parted, but not for the kernel
(https://elixir.bootlin.com/linux/latest/source/block/partitions/msdos.c#L3=
68)
Anyway:

Reviewed-by: Martin Wilck <mwilck@suse.com>


--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

