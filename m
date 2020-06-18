Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A7A2E1FFBDC
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 21:35:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592508927;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=inf5asgK/CyFDBgWFD3ziZQXZUxd5VPZDLV4ynXG36s=;
	b=CmTDsF0ET7Cl2SpQs5wH0pAqVrmjNEkG4Kmere+AP4L/c8nJQ8R1gsphNrWFntfI/oPgtf
	PeRn6UfKFqdfML86VA9PykV4fLvC8qM5+0NAVJGQD2ArJxJ9H89dzDGBL/O/M3u/QJqkqM
	xMUyonjsOYv0Vs2VXD9KxxQtdGQMRX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-BXXTU4l1OD6HZEoMXMMfMw-1; Thu, 18 Jun 2020 15:35:25 -0400
X-MC-Unique: BXXTU4l1OD6HZEoMXMMfMw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CB54A0BD8;
	Thu, 18 Jun 2020 19:35:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A839C1E2274;
	Thu, 18 Jun 2020 19:35:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FED6833CF;
	Thu, 18 Jun 2020 19:35:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IJYlPt020625 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 15:34:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EC1652166BA3; Thu, 18 Jun 2020 19:34:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E12542157F23
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 19:34:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05388800294
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 19:34:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05on2069.outbound.protection.outlook.com [40.107.21.69])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-242-WL-8FzMzNcOwKAlLeDzcYQ-1; Thu, 18 Jun 2020 15:34:41 -0400
X-MC-Unique: WL-8FzMzNcOwKAlLeDzcYQ-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB6411.eurprd04.prod.outlook.com (2603:10a6:10:10c::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22;
	Thu, 18 Jun 2020 19:34:39 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e%4]) with mapi id 15.20.3109.021;
	Thu, 18 Jun 2020 19:34:39 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 2/7] multipathd: fix check_path errors with removed map
Thread-Index: AQHWRQbcMR+kt/LI6U+LyjXcrZPwaajexPOA
Date: Thu, 18 Jun 2020 19:34:38 +0000
Message-ID: <f09ec3b6537a7b7ac1ae26433e43846176f1dd48.camel@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1592439867-18427-3-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29bbde09-bc4e-4386-d502-08d813bea411
x-ms-traffictypediagnostic: DB8PR04MB6411:
x-microsoft-antispam-prvs: <DB8PR04MB64117DDB689AF75C8E5C3B3CFC9B0@DB8PR04MB6411.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ei2SMB1GeBtJaM7xR7HO/XOowUf+LhpHtjMTbCTVfBwrbrkY2QiNEGMzCx0CxnbTLg2XLAydtaKpdIBF8tSpoSSiBTQjKo6LlySR5OmtI51uVCJD7I/0tBkluxnbe4klb36PDpX/tVrxjMwV3/eRlzA73qYx54sRSFPKzvJewVxWfKiwIXkUnrsNxuJP+H6naMGisqD01mo/HASM/ic9l5/s0HNe3EVyn67F9RLG2ji5mbc4mCclMLKLv316xJWFH5vI6ILIce6/e0+SVkWUCSm62aDAATfyvTzSC80OVgzN6TfKJy/e3ful7/K+Qz75bUwaSTBkMSOUedKNj+N9zFAu7guD5gGEcTQkPCYhrGTlCfTYxhN5xByUikwEFVvA3yQblnhGxGb8aKm9erQD5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(136003)(346002)(366004)(396003)(39860400002)(376002)(110136005)(8676002)(6486002)(5660300002)(36756003)(2906002)(508600001)(6512007)(71200400001)(966005)(8936002)(4326008)(316002)(54906003)(2616005)(186003)(66946007)(66476007)(64756008)(66446008)(66556008)(91956017)(76116006)(26005)(6506007)(86362001)(83380400001)(66574015);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: qGHUt6xjUBaTGumPn/UMknEH2DmaIakZqpC3blJmacGedGNHbkCyAmspWlpEDSKSOIgQyMkmpVGWcbyhSajPFMN+qQLVk8mWq0paTTaCb6H+F9UX+HmQRxA7A4ofhkTA0IN8V63IJBAGNDk10aV+hhJ7r7PJEiGhATIqhDjXFNuJkubcooQPDwI28l/5+tsUBdN57oHpdDKMVC4GPQ+OCeU45np8+TGA+Qo7JKDUslLBCCJlO+sXtzBpqVPxJmG/v8lwgVlS69nroEEftSgZ5VBIyxELdfLGk+a1BySH42pxtccd2Z/aQwcB8lxm4JypjE+OK1GVZmhLP8qr3h1NQeYmd6p2wPlcQJYNT+qTpuZzS87TPenA7RhztXxabrpmnY+RBihCMA73YKN05kKBpxijAmo0SL3oDVUhyGgxM2xROPo6W1eAtCf+q47/iNx7DLnCdofHijOjMXpx6D6QlMXBjQ1z/x1+rZLUChcqI7M=
x-ms-exchange-transport-forked: True
Content-ID: <8FD549361DF7BD42955A32E64635A909@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bbde09-bc4e-4386-d502-08d813bea411
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 19:34:38.8692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8dBUf7Wj93ke60ZFXRXMX56iJ/CNMt4g+CtlXpEttCWc87I/vfVejeGOUjIG1GDBm/VPcqz7js+gH4FYIHlnDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6411
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05IJYlPt020625
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-06-17 at 19:24 -0500, Benjamin Marzinski wrote:
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

fac68d7 is related to the famous "dm-multipath: Accept failed paths for
multipath maps" patch (e.g.=20
https://patchwork.kernel.org/patch/3368381/#7193001), which never made
it upstream. SUSE kernels have shipped this patch for a long time, but
we don't apply it any more in recent kernels.

With this patch, The reinstate_path() failure would occur if multipathd
had created a table with a "disabled" device (one which would be
present in a dm map even though the actual block device didn't exist),
and then tried to reinstate such a path. It sounds unlikely, but it
might be possible if devices are coming and going in quick succession.
In that situation, and with the "accept failed path" patch applied, a
reload makes some sense, because reload (unlike reinstate) would not
fail (at least not for this reason) and would actually add that just-
reinstated path. OTOH, it's not likely that the reload would improve
matters, either. After all, multipathd is just trying to reinstate a
non-existing path. So, I'm fine with skipping the reload.

>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  multipathd/main.c | 36 ++++++++++++++----------------------
>  1 file changed, 14 insertions(+), 22 deletions(-)
>=20
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 6b7db2c0..8fb73922 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -1611,22 +1611,18 @@ fail_path (struct path * pp, int del_active)
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
>  static void
> @@ -2088,8 +2084,13 @@ check_path (struct vectors * vecs, struct path
> * pp, unsigned int ticks)
>  =09 * Synchronize with kernel state
>  =09 */
>  =09if (update_multipath_strings(pp->mpp, vecs->pathvec, 1)) {
> +=09=09struct dm_info info;
>  =09=09condlog(1, "%s: Could not synchronize with kernel
> state",
>  =09=09=09pp->dev);
> +=09=09if (pp->mpp && pp->mpp->alias &&
> +=09=09    do_dm_get_info(pp->mpp->alias, &info) =3D=3D 0)
> +=09=09=09/* multipath device missing. Likely removed */
> +=09=09=09return 0;
>  =09=09pp->dmstate =3D PSTATE_UNDEF;

It would be more elegant if we could distinguish different failure
modes from update_multipath_strings() directly, without having to call
do_dm_get_info() again.

>  =09}
>  =09/* if update_multipath_strings orphaned the path, quit early */
> @@ -2179,12 +2180,8 @@ check_path (struct vectors * vecs, struct path
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
> @@ -2200,15 +2197,10 @@ check_path (struct vectors * vecs, struct
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

