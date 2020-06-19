Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9C4200A8C
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 15:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592574338;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mhNx6XK4/kApRiJjKZShAlGj1tK8kWAzZtmd2i8Us7Y=;
	b=V4a2Px5EsDSikA6bMkwyhgmEDIau0sCH5NJJxEqgz1kgvM863KrE08+PcKiHQLfjYW5CCl
	sMZtjxI3QnEhZZZ+NxhxI33AAmjEfwPfk3n8l/JBIskDZQDa3MApW2hCIyTnZ2hZeomZEU
	pB8cDCyT5IwUyg4okh2SsaIFUnyYbvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-11Rc2xQvMOm2B9Ia_ilcOQ-1; Fri, 19 Jun 2020 09:45:34 -0400
X-MC-Unique: 11Rc2xQvMOm2B9Ia_ilcOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F8F4102C80F;
	Fri, 19 Jun 2020 13:45:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BD305C241;
	Fri, 19 Jun 2020 13:45:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5970A833B1;
	Fri, 19 Jun 2020 13:45:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JDgsEp004435 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 09:42:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B7F62156A3B; Fri, 19 Jun 2020 13:42:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23A4C2157F26
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 13:42:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 090CD801020
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 13:42:52 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr70072.outbound.protection.outlook.com [40.107.7.72]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-94-tZP6SE4ZPR64dg3u_RztQA-1; Fri, 19 Jun 2020 09:42:49 -0400
X-MC-Unique: tZP6SE4ZPR64dg3u_RztQA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB6924.eurprd04.prod.outlook.com (2603:10a6:10:11e::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22;
	Fri, 19 Jun 2020 13:42:47 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e%4]) with mapi id 15.20.3109.021;
	Fri, 19 Jun 2020 13:42:47 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [dm-devel] [PATCH 2/7] multipathd: fix check_path errors with
	removed map
Thread-Index: AQHWRQbcMR+kt/LI6U+LyjXcrZPwaajexPOAgAA+L4CAAPHXAA==
Date: Fri, 19 Jun 2020 13:42:47 +0000
Message-ID: <6f9284eeec0dda69e8e4dd4b2858f02d3c31fb8b.camel@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-3-git-send-email-bmarzins@redhat.com>
	<f09ec3b6537a7b7ac1ae26433e43846176f1dd48.camel@suse.com>
	<20200618231711.GM5894@octiron.msp.redhat.com>
In-Reply-To: <20200618231711.GM5894@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51ec2504-d854-4404-f1eb-08d81456a6e5
x-ms-traffictypediagnostic: DB8PR04MB6924:
x-microsoft-antispam-prvs: <DB8PR04MB69243CA13EC1332DBF840676FC980@DB8PR04MB6924.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 70CbJunhWf4LF3+NEtIfjjhG+OXUZfBTL6Pu4/WkhOf1iRrLsfttcJQ3ewAYzhf01LyuZuWffyAAmS5dioHFefB1cVPQSj9tEJWjsJOLAumMckIl+vpSF3kJkG2vn4PfjIpTv4HGNtAcd5lUFy9UkRrYYPWk4pNaXlhyxtupVJ9OwpnMCBIT0H5Cq/Bhet8Dst1Xvm6f8Q5jvRg+XipVUsZcTjQ5Y7I1MqNn8tjQ4QJ7Hnz7rGckMPFXTwCKFaObp8KDKWCB+Q6chhWTZ7HtropmRduOpev1/3GpR28ueeWEE/LO/P/vrJUsEDZZ44L/E+u0QQSBr2We7w5ujGbm/Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(136003)(39860400002)(396003)(366004)(346002)(376002)(54906003)(316002)(2616005)(478600001)(6506007)(6916009)(26005)(2906002)(8936002)(8676002)(186003)(36756003)(91956017)(66946007)(71200400001)(6512007)(6486002)(66574015)(83380400001)(4326008)(66476007)(5660300002)(86362001)(66446008)(76116006)(66556008)(64756008);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: mtw6V6HFq5/V5JaNBTIfsfllHQ7GpphIkM565EQFK0tlUBt+NDBUFWY1NkR2Q8dkdJ5Ao5bB8jIc3FSRu0Ua4ANKtWwFmowtRvBKNgnms25P0EmBuTpSD7IS+e4wggWvUuOqxHx/TyMNEQN3jZq7B+R8kb5NutK/o++x/ym7PSiBfJyjWc51DN+APFFcAiohdj+aitcKwpsoT/Q5sPxtrrc/3BWY/ZTrl5PIV66UEgSGNWnIEBg1pQxBMXONVbtShLop5rzoVvWknDJEVw3ADrqueBwVoTm1FFiA3C1Tl5ZausyY0kuw2HZZYhjEn6EdNLRyYsCy57ys2CTtNe2mUL5bIoIEMCsGBrYNSPZaphIHS9J3jLA4CVD77eBIT4d0qVye2eEhvrR8fTdN+lGzaszWabp5FxDE+sZXSr5PT+ksc2zczjf1IK2fSjDIhz91+5kNEmUb2Mw5Y1CNUzKF5G3iSTVjqZD+wkqukFdS5lo=
x-ms-exchange-transport-forked: True
Content-ID: <5932E0CA4CFE054893B045384C65A060@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ec2504-d854-4404-f1eb-08d81456a6e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 13:42:47.1656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4uoJAlXfHebtzemKw/fcR4Mp37W928BfpPU6dqSE8sfwHYBQ1bI1m3HbxR/iYk1/w5yzuKE7zYuCID0pht4tBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6924
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05JDgsEp004435
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/7] multipathd: fix check_path errors with
 removed map
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-06-18 at 18:17 -0500, Benjamin Marzinski wrote:
> On Thu, Jun 18, 2020 at 07:34:38PM +0000, Martin Wilck wrote:
> > On Wed, 2020-06-17 at 19:24 -0500, Benjamin Marzinski wrote:
> > >=20
> > >  static void
> > > @@ -2088,8 +2084,13 @@ check_path (struct vectors * vecs, struct
> > > path
> > > * pp, unsigned int ticks)
> > >  =09 * Synchronize with kernel state
> > >  =09 */
> > >  =09if (update_multipath_strings(pp->mpp, vecs->pathvec, 1)) {
> > > +=09=09struct dm_info info;
> > >  =09=09condlog(1, "%s: Could not synchronize with kernel
> > > state",
> > >  =09=09=09pp->dev);
> > > +=09=09if (pp->mpp && pp->mpp->alias &&
> > > +=09=09    do_dm_get_info(pp->mpp->alias, &info) =3D=3D 0)
> > > +=09=09=09/* multipath device missing. Likely removed */
> > > +=09=09=09return 0;
> > >  =09=09pp->dmstate =3D PSTATE_UNDEF;
> >=20
> > It would be more elegant if we could distinguish different failure
> > modes from update_multipath_strings() directly, without having to
> > call
> > do_dm_get_info() again.
>=20
> Seems reasonable. I'll take a look at that.

Yet another idea: I just discussed this with Hannes, and he pointed out
that right below this code, we have

=09/* if update_multipath_strings orphaned the path, quit early */
=09if (!pp->mpp)
=09=09return 0;

... which could have the same effect, if pp->mpp was reloaded. Probably
that doesn't happen because the pp->mpp dereference is cached in a
register, but we could simply add a READ_ONCE there.

Choose what you prefer.

Regards,
Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

