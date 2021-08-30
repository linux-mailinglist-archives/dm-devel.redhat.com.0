Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id ACD393FBC65
	for <lists+dm-devel@lfdr.de>; Mon, 30 Aug 2021 20:26:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630347998;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JgKqX10Nw672d2wa5Kkip9AidA9+BpWbZEv9B+C5a8Q=;
	b=QYNNvsjzJbPjSDVLN+YFLS0p0lybV8Ods6s2w0tvV8GAXCU0GrIZzC75mPGyjGKiHrrY2J
	W2FOoD1swfVwqJAvRChBLaFeGZR7moCCdQawmhJqIPss7GdS9zRD28rVAGSHwMYCC6hYaf
	rSV2gQtdrdqP54hHMMmS93Gz/3L+oSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-j20u733MPuKH97rHQ8Fylg-1; Mon, 30 Aug 2021 14:26:36 -0400
X-MC-Unique: j20u733MPuKH97rHQ8Fylg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8247387D569;
	Mon, 30 Aug 2021 18:26:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14E217883D;
	Mon, 30 Aug 2021 18:26:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E729181A0F7;
	Mon, 30 Aug 2021 18:26:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17UINpvl025770 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Aug 2021 14:23:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70DEC5C23A; Mon, 30 Aug 2021 18:23:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB9225C1D5;
	Mon, 30 Aug 2021 18:23:46 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 17UINirB022005; 
	Mon, 30 Aug 2021 13:23:45 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 17UINiQj022004;
	Mon, 30 Aug 2021 13:23:44 -0500
Date: Mon, 30 Aug 2021 13:23:44 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20210830182344.GV3087@octiron.msp.redhat.com>
References: <20210715105223.30463-1-mwilck@suse.com>
	<20210715105223.30463-5-mwilck@suse.com>
	<20210728190343.GL3087@octiron.msp.redhat.com>
	<fb0961e9e14bdfc655561cc078069614fb7268a6.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <fb0961e9e14bdfc655561cc078069614fb7268a6.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 4/9] libmultipath: use strbuf in dict.c
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 11, 2021 at 05:27:05PM +0200, Martin Wilck wrote:
> On Mi, 2021-07-28 at 14:03 -0500, Benjamin Marzinski wrote:
> > On Thu, Jul 15, 2021 at 12:52:18PM +0200, mwilck@suse.com=A0wrote:
> > > From: Martin Wilck <mwilck@suse.com>
> > >=20
> > > Temporary solution for snprint_keyword(), as print.c hasn't been
> > > migrated yet.
> >=20
> > Mostly good. I have some minor issues with this.
> >=20
> > >=20
> > > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > > ---
> > > =A0libmultipath/dict.c=A0=A0=A0 | 313 ++++++++++++++++++-------------=
------
> > > ----
> > > =A0libmultipath/dict.h=A0=A0=A0 |=A0 19 +--
> > > =A0libmultipath/parser.c=A0 |=A0 47 ++++---
> > > =A0libmultipath/parser.h=A0 |=A0 15 +-
> > > =A0libmultipath/propsel.c | 147 +++++++++----------
> > > =A05 files changed, 253 insertions(+), 288 deletions(-)
> > >=20
> > > =A0
> > > @@ -419,21 +381,18 @@ declare_ovr_snprint(selector, print_str)
> > > =A0declare_mp_handler(selector, set_str)
> > > =A0declare_mp_snprint(selector, print_str)
> > > =A0
> > > -static int snprint_uid_attrs(struct config *conf, char *buff, int
> > > len,
> > > +static int snprint_uid_attrs(struct config *conf, struct strbuf
> > > *buff,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 const void *dummy)
> > > =A0{
> > > -=A0=A0=A0=A0=A0=A0=A0char *p =3D buff;
> > > -=A0=A0=A0=A0=A0=A0=A0int n, j;
> > > +=A0=A0=A0=A0=A0=A0=A0int j, ret;
> > > =A0=A0=A0=A0=A0=A0=A0=A0const char *att;
> > > =A0
> > > =A0=A0=A0=A0=A0=A0=A0=A0vector_foreach_slot(&conf->uid_attrs, att, j)=
 {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0n =3D snprintf(p, len, =
"%s%s", j =3D=3D 0 ? "" : " ",
> > > att);
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (n >=3D len)
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return (p - buff) + n;
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0p +=3D n;
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0len -=3D n;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D print_strbuf(bu=
ff, "%s%s", j =3D=3D 0 ? "" : " ",
> > > att);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (ret < 0)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return ret;
> > > =A0=A0=A0=A0=A0=A0=A0=A0}
> >=20
> > On success, this should return the amount of data written, instead of
> > like the other snprint_* functions, not 0.
> >=20
> > > -=A0=A0=A0=A0=A0=A0=A0return p - buff;
> > > +=A0=A0=A0=A0=A0=A0=A0return 0;
>=20
> Right, thanks!
>=20
>=20
> > > +snprint_ble_simple (struct config *conf, struct strbuf *buff,
> > > const void *data)
> > > =A0{
> > > -=A0=A0=A0=A0=A0=A0=A0const struct blentry * ble =3D (const struct bl=
entry *)data;
> > > +=A0=A0=A0=A0=A0=A0=A0const struct blentry *ble =3D (const struct ble=
ntry *)data;
> > > =A0
> > > -=A0=A0=A0=A0=A0=A0=A0return snprintf(buff, len, "\"%s\"", ble->str);
> >=20
> > We should probably quote the regexes when printing them, so either
> > append_strbuf_quoted() or, if you're worried about how that would
> > handle
> > interior quotes, print_strbud with "\"%s\"".
> >=20
> > > +=A0=A0=A0=A0=A0=A0=A0return print_str(buff, ble->str);
>=20
> print_str() already calls append_strbuf_quoted(). Am I overlooking
> something?

I'm not sure what I was thinking here.  This looks fine.

-Ben

>=20
> Thanks,
> Martin
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

