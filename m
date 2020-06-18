Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1861FFC99
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 22:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592512683;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/x9E1kT9vTTfm0XSxXPa2lACas/CYJPYHp7dy7oJeXE=;
	b=fPtzdZEeI/5VCIQTFIRzfUkXtUtNrYd4o81+Zerpd7E25mIrMKZ+BLXrOPdhAK3i9ZaYgR
	bbZmFXxuFnofSOHT6WUpRFzcFqQtmpVBUE+GFTwtKFuPO4szOwgzDD0fiYmmoGp51LfpAs
	YgnwAEHraDoknnOH2loSp6Q5X1W67ng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-NVlcTyliNoieqFFE0qgfcw-1; Thu, 18 Jun 2020 16:38:00 -0400
X-MC-Unique: NVlcTyliNoieqFFE0qgfcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADF2680B722;
	Thu, 18 Jun 2020 20:37:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3DB319C4F;
	Thu, 18 Jun 2020 20:37:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1BE51809547;
	Thu, 18 Jun 2020 20:37:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IKbW6e029697 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 16:37:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 67A9E1055DA9; Thu, 18 Jun 2020 20:37:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 605761055DA5
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 20:37:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58238833B44
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 20:37:27 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60061.outbound.protection.outlook.com [40.107.6.61]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-463-nABQXEcpMYiX2KtMj_Zk3g-1; Thu, 18 Jun 2020 16:37:23 -0400
X-MC-Unique: nABQXEcpMYiX2KtMj_Zk3g-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB5881.eurprd04.prod.outlook.com (2603:10a6:10:a7::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19;
	Thu, 18 Jun 2020 20:37:20 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e%4]) with mapi id 15.20.3109.021;
	Thu, 18 Jun 2020 20:37:20 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 4/7] multipathd: add "del maps" multipathd command
Thread-Index: AQHWRQbggTrW34M7SUy3Z30Naz15yqje1neA
Date: Thu, 18 Jun 2020 20:37:20 +0000
Message-ID: <e27f7ecbc221185773df1db7b36209db6d1bd61a.camel@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1592439867-18427-5-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad7db0f8-254d-4c7b-a488-08d813c7664e
x-ms-traffictypediagnostic: DB8PR04MB5881:
x-microsoft-antispam-prvs: <DB8PR04MB5881658B5B5E4B62C150F1EEFC9B0@DB8PR04MB5881.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h+BZPn1b4fa+YhHqECEDas1/vSAyalyQXjfD+qY+zIvdlN8JetbqhQm0QluRUz9moGvrii3eV6V35iUwXYA2eP2q1eTx9LQifdaWgp/qVWqCFF4rc92nPNr+Snddt31ZdgQhI8rvlumN9Ll+GeuIvxH4ffY1GToZ8qJCoXZi4iwjHmwlupstKNKPMKDZ3GXUYKLR21MAUqIkswYEiqEd9JUwHZ4pT8XT2b3JZeBUXmwWmilPABBTRrqhXg/OM5jxSV7l2CXlxWP8eT8do+tGJGZSr+kFatyTzterSDUgggeCOVNbgwUEc2NUg4JkzZfe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(366004)(39860400002)(376002)(136003)(346002)(396003)(316002)(508600001)(4326008)(76116006)(8676002)(66446008)(2616005)(6506007)(6486002)(91956017)(6512007)(66556008)(36756003)(110136005)(66476007)(66946007)(64756008)(8936002)(5660300002)(186003)(2906002)(86362001)(83380400001)(26005)(71200400001)(66574015);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: zqxLuxcfU+gQ5Q6TEhmxWuH92gYYxXeLnWhN9AK0ostWqSTHC2PCYnx1L8p0gT1hWVL1xWVbnaZ0wx6MVD+PFYJZoK4h/b65ZQ4DIbAbAC0S9zXrrOpKadr2DIE0cmeo8E26ldsZ7OUKtusdI6w05TMVtTiQIFjRd92vOYzHJVsiq0hlYh98q2LyUtLgPQcYCBwTcrfFnXa1uesNm34hJ/doXV2XzKWFh+F1TdHnU5OmQc3Uq2CCzMp3dnCGqENONTRlK+CzxgVc+HBGR5CEJ/C9pRx8wtSXYX9zJ+zp/ySPFeVvqS+miezMKD2AdheIGYHe2mXV+CFcFlu0ahd/1Z1Arz3LWaolhkJmVz4crLgKyrV6CaEOUmGq8YLqxwaTY9s8u5EC7617KDWQo34okCnmle8a52TH1VLnnad6cC0H+3CkNUvAaRly9NhyF95r7K0ptVlyLQiV7nohNjBQnAS+BsSfBhWp57p5R1hwCBY=
x-ms-exchange-transport-forked: True
Content-ID: <1006ED94800AC2429401FB8429883F70@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7db0f8-254d-4c7b-a488-08d813c7664e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 20:37:20.7805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHMj3ehfsc56asa4naS7KRzQ3Kwj2T7JoT/FaK3iHAYeNaa1Vai84qjuz8ivnjA4dbIML+Gpjwm7bGq2E/2oyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5881
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05IKbW6e029697
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-06-17 at 19:24 -0500, Benjamin Marzinski wrote:
> This will flush all multipath devices.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/devmapper.c  |  7 +++++--
>  libmultipath/devmapper.h  |  2 +-
>  multipath/main.c          |  2 +-
>  multipathd/cli.c          |  1 +
>  multipathd/cli_handlers.c | 19 +++++++++++++++++++
>  multipathd/cli_handlers.h |  1 +
>  multipathd/main.c         |  3 ++-
>  multipathd/main.h         |  1 +
>  8 files changed, 31 insertions(+), 5 deletions(-)
>=20
> diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> index 682c0038..a5e0d298 100644
> --- a/libmultipath/devmapper.c
> +++ b/libmultipath/devmapper.c
> @@ -991,7 +991,7 @@ dm_flush_map_nopaths(const char * mapname, int
> deferred_remove)
> =20
>  #endif
> =20
> -int dm_flush_maps (int retries)
> +int dm_flush_maps (int need_suspend, int retries)
>  {
>  =09int r =3D 1;
>  =09struct dm_task *dmt;
> @@ -1014,7 +1014,10 @@ int dm_flush_maps (int retries)
> =20
>  =09r =3D 0;
>  =09do {
> -=09=09r |=3D dm_suspend_and_flush_map(names->name, retries);
> +=09=09if (need_suspend)
> +=09=09=09r |=3D dm_suspend_and_flush_map(names->name,
> retries);
> +=09=09else
> +=09=09=09r |=3D dm_flush_map(names->name);

This is fine, but considering the previous discussion, I'd prefer to
get rid of need_suspend and dm_suspend_and_flush_map() entirely. It
would simplify the _dm_flush_map code path significantly.

As we determined that we use the suspend/resume only in multipath
anyway, we could add it there in the "non-delegated" code path.

Thanks,
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

