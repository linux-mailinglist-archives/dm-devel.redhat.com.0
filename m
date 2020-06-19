Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E288D200A48
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 15:36:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592573771;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=67YAi65E00cqJ9QSdTYA4T6gVsTS6tiVZpKJd8eQWjo=;
	b=La9pdmi9NSPtsj/6i/uQ3bLBbWyPZkYMN+DGaSf2DEr1mJBhfpxEajQWXwZvu/YpIeAHMr
	nrZV+PodP8e07aUQuMMM1KYpQSfnMZdEDbiodKFGG/MJ4Vyok8GVtTnX+j5lEDD6s4roO9
	pZY9ZGGjfTSoh+mauavrZ0ZiQyIQEjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-Z_8m5kv3PViA7-0YTfavSQ-1; Fri, 19 Jun 2020 09:36:09 -0400
X-MC-Unique: Z_8m5kv3PViA7-0YTfavSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04FEC835B45;
	Fri, 19 Jun 2020 13:36:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F93F5C1D6;
	Fri, 19 Jun 2020 13:36:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87AB6833C3;
	Fri, 19 Jun 2020 13:35:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JDZkvA003345 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 09:35:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 432AE2029F70; Fri, 19 Jun 2020 13:35:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D8FD2029F62
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 13:35:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1E08833B47
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 13:35:43 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-291-CtzrBqfCNBK2eG9KikDFwg-1; Fri, 19 Jun 2020 09:35:39 -0400
X-MC-Unique: CtzrBqfCNBK2eG9KikDFwg-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB6410.eurprd04.prod.outlook.com (2603:10a6:10:3d::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22;
	Fri, 19 Jun 2020 13:35:36 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e%4]) with mapi id 15.20.3109.021;
	Fri, 19 Jun 2020 13:35:36 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [PATCH 4/7] multipathd: add "del maps" multipathd command
Thread-Index: AQHWRQbggTrW34M7SUy3Z30Naz15yqje1neAgAArPwCAAPFBgA==
Date: Fri, 19 Jun 2020 13:35:36 +0000
Message-ID: <1cfbed51fbef1958305638cb8a921ff8ec97792f.camel@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-5-git-send-email-bmarzins@redhat.com>
	<e27f7ecbc221185773df1db7b36209db6d1bd61a.camel@suse.com>
	<20200618231206.GK5894@octiron.msp.redhat.com>
In-Reply-To: <20200618231206.GK5894@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 921fb366-8178-48b2-c3cf-08d81455a654
x-ms-traffictypediagnostic: DB8PR04MB6410:
x-microsoft-antispam-prvs: <DB8PR04MB64107A3A24D92B709CED7461FC980@DB8PR04MB6410.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: haD/H8CXunZU7kJQW5VlT3dc0K0q1jpkvR9/katZ3tkJimnVAaxOTtTIuWrpl1qIVG16SREjTJZCbHRQODKH32NHAp3Wm0nkev89ShtMO9P4xLCefd+DB1XEnSTY0RF3HqwPmVBoWTJv+mgg4g0vBW4X+pkO7J6xpxCw6/O03ZTl68FETB4Q/n2RRTSnZj3EmsOyMQAwiUp0XAV9c1Dd2a+U3MZeUIp9fTvdwSeErovDlYTQtLqMlzHBa5LqrV04w2uX/HeQKilYlLYboR4dWDmWorsJcx8XCW+SmvL7UTdYOKRW+r2eKihSR1+vYYCt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(346002)(396003)(136003)(39860400002)(366004)(376002)(478600001)(5660300002)(316002)(2616005)(26005)(2906002)(36756003)(6506007)(86362001)(8936002)(83380400001)(6486002)(8676002)(66556008)(54906003)(64756008)(66946007)(66574015)(186003)(76116006)(91956017)(4326008)(71200400001)(6916009)(6512007)(66476007)(66446008);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: +230ePbuU1oHXV9ieRUx20NoC0t+vmw6vgkV9hva6Qm3snF4H5oB43AES7ZS1BVr43A4jsYAacHqkLfi/8v2HeElWbDTV+7hAJ1dnyQrtIP8AV2G55Ax96D2TtFt3U3UENkYv093GjWcYNjyLJ/wradruLOtI3OMnDBSxDYTP/xvFKvBnT3aAvtNWZfDct3ff+UfKmpVHqGKC5typOW0YozUvCcTK+dGX06BblBSvBxO7HtuhZZpkb97tTtPN4/8ylNp2CHsmnxhbWii3UXFp9zL+JHxiKOmeG82XffUjESJqWbkT/uA7FAhrQCz/UmNlRKS0M5aJnH27eA1ufjFKg6M2Id/oXMt+nYiPQfpWEDluewW9SNAcjALkklv9l7teCKVMIM7FKEkcnbrZm2X+T0dx8n46FQlk3TkQEV5Xyr++KhAI3MXqA36Ygjnos79bi+Vz9xOAslQcX6VnJVbDs9VPFEiNQ0OtibtFE2oHeY=
x-ms-exchange-transport-forked: True
Content-ID: <2581A7AD2BB83F4C8413676528920755@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 921fb366-8178-48b2-c3cf-08d81455a654
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 13:35:36.7324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nLMsvM//GRFTxHSWujmu+2wAVNIEZDIkl59Ol19JIkwKzE63VO7OIMYMtcBvNEl+ggryrcWCWKOihoZFgzroOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6410
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05JDZkvA003345
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/7] multipathd: add "del maps" multipathd
	command
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

On Thu, 2020-06-18 at 18:12 -0500, Benjamin Marzinski wrote:
> On Thu, Jun 18, 2020 at 08:37:20PM +0000, Martin Wilck wrote:
> >=20
> > > -int dm_flush_maps (int retries)
> > > +int dm_flush_maps (int need_suspend, int retries)
> > >  {
> > >  =09int r =3D 1;
> > >  =09struct dm_task *dmt;
> > > @@ -1014,7 +1014,10 @@ int dm_flush_maps (int retries)
> > > =20
> > >  =09r =3D 0;
> > >  =09do {
> > > -=09=09r |=3D dm_suspend_and_flush_map(names->name, retries);
> > > +=09=09if (need_suspend)
> > > +=09=09=09r |=3D dm_suspend_and_flush_map(names->name,
> > > retries);
> > > +=09=09else
> > > +=09=09=09r |=3D dm_flush_map(names->name);
> >=20
> > This is fine, but considering the previous discussion, I'd prefer
> > to
> > get rid of need_suspend and dm_suspend_and_flush_map() entirely. It
> > would simplify the _dm_flush_map code path significantly.
> >=20
> > As we determined that we use the suspend/resume only in multipath
> > anyway, we could add it there in the "non-delegated" code path.
>=20
> I'm confused. dm_flush_maps() is also called in the non-delegated
> code
> path, where it uses the dm_suspend_and_flush_map(). Are you proposing
> an alternative version of dm_flush_maps() for multipath?

No, just a different error handling in multipath. Instead of calling
just calling dm_flush_maps() again from multipath with need_suspend=3D1,
we could suspend / resume directly in the error path, and then call
dm_flush_map again. Which would allow us to get rid of need_suspend, as
no callers would set it any more.

IOW, move the handling of this multipath-specific error situation out
of libmultipath, into the multipath-specific code.

Just an idea, I don't insist on it.

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

