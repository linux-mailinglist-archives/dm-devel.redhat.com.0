Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E705121143B
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 22:20:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-SYPrtNnSPZWzJ_riKYD_Mg-1; Wed, 01 Jul 2020 16:20:24 -0400
X-MC-Unique: SYPrtNnSPZWzJ_riKYD_Mg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97203107ACF6;
	Wed,  1 Jul 2020 20:20:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06EEE77885;
	Wed,  1 Jul 2020 20:20:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 295FB6C9C6;
	Wed,  1 Jul 2020 20:20:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061KKBGS016840 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 16:20:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30EF0202F2FE; Wed,  1 Jul 2020 20:20:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BDFD202DD7E
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 20:20:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39BA81064C6C
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 20:20:08 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [51.163.158.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-27-6rHudJb1M4e3YOyGwIHGVw-1;
	Wed, 01 Jul 2020 16:20:01 -0400
X-MC-Unique: 6rHudJb1M4e3YOyGwIHGVw-1
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
	(mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-7-EFpuyAa2NdW_1AKLp6OAIg-1; Wed, 01 Jul 2020 22:19:58 +0200
X-MC-Unique: EFpuyAa2NdW_1AKLp6OAIg-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB7PR04MB4474.eurprd04.prod.outlook.com (2603:10a6:5:3c::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23;
	Wed, 1 Jul 2020 20:19:58 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3131.028;
	Wed, 1 Jul 2020 20:19:58 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 2/7] multipathd: fix check_path errors with removed map
Thread-Index: AQHWSzEoUvJo8tA4lEi8MJWMoNTln6jzM5eA
Date: Wed, 1 Jul 2020 20:19:57 +0000
Message-ID: <ef233115bdd98efb898ba2c1c6777d70fa37b92d.camel@suse.com>
References: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
	<1593117741-28750-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593117741-28750-3-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4afb09af-ce9e-405e-e8c7-08d81dfc2019
x-ms-traffictypediagnostic: DB7PR04MB4474:
x-microsoft-antispam-prvs: <DB7PR04MB4474366DF99EDABA04BF44EFFC6C0@DB7PR04MB4474.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:612;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 20MCVu47p37eyeArGzwUK2cyQvxXHLEVHvZJxCaivMHyTdtyt7BNT6dILnrZuVbXNv3p+U8oXkAhCNCoOpfbhu4Pomuwfmq1hhsT78lmgxW7R3193qxlE+GkBsCrQh/chEj1p0sXY8WoPtu8JxYQQigJnV6LF3h9MsLtN+qPTmPDiAmemCGwIgHmME4rh1+c/Lr8kEjyoX95dYH9evXF58WNCQ5HCjz2bkvToynHwpIcNCh4p2vvf71NXvY+ekSktglGmA7lZfUtbPHhGZ49r/7AfOOzWrG1q43GF3PSshCMiFN16EbrFtSLAIRPSTdCvzV5f76mQ1bcu8nTc0/qOQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(376002)(39860400002)(346002)(396003)(136003)(366004)(478600001)(6506007)(66574015)(6486002)(8936002)(110136005)(2906002)(316002)(36756003)(66946007)(66556008)(66446008)(64756008)(66476007)(91956017)(76116006)(5660300002)(83380400001)(86362001)(6512007)(8676002)(4326008)(186003)(71200400001)(2616005)(26005);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: rAB3pHhe61teKaHFswzLc95zyKRhBcbEDt7tNdF9s49pe+WeHUf2QmTaQirbHPRTbrHyU6AfxPps1sO8MtRODzhNf485oxSvolTmqoyb0xxArWjsCIwHZCm32JynNyxl1Q2pRKHdZXRgI8CUak8O8iv5okNYCX1w/rjEp7SUri+3TurDSAU4yS/YmszNCeqa8e28T+k97rvPHb4C8oAEtJCgbqkwUz33wagFgoTAWe11ddnOmqtyqM1CxQNe8xIs1CGG18fQhxlxkDSe+8jDgjhG6oPPRzoJgs+sHx4Vj+k7DeYFQKHKayg424VYxbbqWnc7DFlc+bG+srb2FEGzDySJY4l/zTezda6igNhPM0v+ZmFIP8c/Krk4REUtqMwsZw17N6koKQpjcMZEYNGhyuob7XU+ROI/El7xzGIWUoNF63AZB99kKwr3NiePil5ZYQTAjzA4qoU6W3h21J+leG94GM82jOSs2WWp1mhXnOeZE0YXxWZwki3u0iN4NVnr
x-ms-exchange-transport-forked: True
Content-ID: <C9C76011229C0F4ABC178903BD87413A@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4afb09af-ce9e-405e-e8c7-08d81dfc2019
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 20:19:57.9038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OGrTEnogEVfl4uQEw24vz3MRLHMxppeaK8UdWbhJ01vAoMTyDCNflXnO+WuSfzWl1StzJCGi2K5xvOonRHBjWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4474
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 061KKBGS016840
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 2/7] multipathd: fix check_path errors
	with removed map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-06-25 at 15:42 -0500, Benjamin Marzinski wrote:
> If a multipath device is removed during, or immediately before the
> call
> to check_path(), multipathd can behave incorrectly. A missing
> multpath
> device will cause update_multipath_strings() to fail, setting
> pp->dmstate to PSTATE_UNDEF.  If the path is up, this state will
> cause
> reinstate_path() to be called, which will also fail.  This will
> trigger
> a reload, restoring the recently removed device.
>=20
> If update_multipath_strings() fails because there is no multipath
> device, check_path should just quit, since the remove dmevent and
> uevent
> are likely already queued up. Also, I don't see any reason to reload
> the
> multipath device if reinstate fails. This code was added by
> fac68d7a99ef17d496079538a5c6836acd7911ab, which clamined that
> reinstate
> could fail if the path was disabled.  Looking through the current
> kernel
> code, I can't see any reason why a reinstate would fail, where a
> reload
> would help. If the path was missing from the multipath device,
> update_multipath_strings() would already catch that, and quit
> check_path() early, which make more sense to me than reloading does.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  multipathd/main.c | 37 ++++++++++++++-----------------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
>=20
> diff --git a/multipathd/main.c b/multipathd/main.c
> index d73b1b9a..22bc4363 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -1615,22 +1615,18 @@ fail_path (struct path * pp, int del_active)
>  /*
>   * caller must have locked the path list before calling that
> function
>   */
> -static int
> +static void
>  reinstate_path (struct path * pp)
>  {
> -=09int ret =3D 0;
> -
>  =09if (!pp->mpp)
> -=09=09return 0;
> +=09=09return;
> =20
> -=09if (dm_reinstate_path(pp->mpp->alias, pp->dev_t)) {
> +=09if (dm_reinstate_path(pp->mpp->alias, pp->dev_t))
>  =09=09condlog(0, "%s: reinstate failed", pp->dev_t);
> -=09=09ret =3D 1;
> -=09} else {
> +=09else {
>  =09=09condlog(2, "%s: reinstated", pp->dev_t);
>  =09=09update_queue_mode_add_path(pp->mpp);
>  =09}
> -=09return ret;
>  }
> =20
>  static void
> @@ -2091,9 +2087,13 @@ check_path (struct vectors * vecs, struct path
> * pp, unsigned int ticks)
>  =09/*
>  =09 * Synchronize with kernel state
>  =09 */
> -=09if (update_multipath_strings(pp->mpp, vecs->pathvec, 1) !=3D
> DMP_PASS) {
> +=09ret =3D update_multipath_strings(pp->mpp, vecs->pathvec, 1);
> +=09if (ret !=3D DMP_PASS) {
>  =09=09condlog(1, "%s: Could not synchronize with kernel
> state",
>  =09=09=09pp->dev);

We could do even better here by printing different log messages
in the two cases we differentiate.

Apart from that, ACK.

> +=09=09if (ret =3D=3D DMP_FAIL)
> +=09=09=09/* multipath device missing. Likely removed */
> +=09=09=09return 0;
>  =09=09pp->dmstate =3D PSTATE_UNDEF;
>  =09}
>  =09/* if update_multipath_strings orphaned the path, quit early */
> @@ -2183,12 +2183,8 @@ check_path (struct vectors * vecs, struct path
> * pp, unsigned int ticks)
>  =09=09/*
>  =09=09 * reinstate this path
>  =09=09 */
> -=09=09if (!disable_reinstate && reinstate_path(pp)) {
> -=09=09=09condlog(3, "%s: reload map", pp->dev);
> -=09=09=09ev_add_path(pp, vecs, 1);
> -=09=09=09pp->tick =3D 1;
> -=09=09=09return 0;
> -=09=09}
> +=09=09if (!disable_reinstate)
> +=09=09=09reinstate_path(pp);
>  =09=09new_path_up =3D 1;
> =20
>  =09=09if (oldchkrstate !=3D PATH_UP && oldchkrstate !=3D
> PATH_GHOST)
> @@ -2204,15 +2200,10 @@ check_path (struct vectors * vecs, struct
> path * pp, unsigned int ticks)
>  =09else if (newstate =3D=3D PATH_UP || newstate =3D=3D PATH_GHOST) {
>  =09=09if ((pp->dmstate =3D=3D PSTATE_FAILED ||
>  =09=09    pp->dmstate =3D=3D PSTATE_UNDEF) &&
> -=09=09    !disable_reinstate) {
> +=09=09    !disable_reinstate)
>  =09=09=09/* Clear IO errors */
> -=09=09=09if (reinstate_path(pp)) {
> -=09=09=09=09condlog(3, "%s: reload map", pp->dev);
> -=09=09=09=09ev_add_path(pp, vecs, 1);
> -=09=09=09=09pp->tick =3D 1;
> -=09=09=09=09return 0;
> -=09=09=09}
> -=09=09} else {
> +=09=09=09reinstate_path(pp);
> +=09=09else {
>  =09=09=09LOG_MSG(4, verbosity, pp);
>  =09=09=09if (pp->checkint !=3D max_checkint) {
>  =09=09=09=09/*

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

