Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AD43AE9E35
	for <lists+dm-devel@lfdr.de>; Wed, 30 Oct 2019 16:01:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572447697;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/wJcG9oWCZ6Q9dSEiWpHzvWyEtD4XlnEUQOnmKEWMv8=;
	b=RFIt5oGDv3DI9Lto1+IFThfvEcnr+nA7Nq+eAs0rwySvCYv3pxe6BLyA+hbK9HunFwGzZD
	Ls66vXFk8BhLMKZin9SlRc9F7Xf7hz6Djzj4VJ5SMmV7Rl0fCMKB0vpxxA6C2gvLsLkT3x
	pR5Tcsm9ahT0lh8onmal3kEFWOg1Gq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-haVDjhXwNIymTYFy4AuiSg-1; Wed, 30 Oct 2019 11:01:31 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 497E12EDD;
	Wed, 30 Oct 2019 15:01:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A0D21001B00;
	Wed, 30 Oct 2019 15:01:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61D4D182B010;
	Wed, 30 Oct 2019 15:01:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9UEtZcP012188 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 30 Oct 2019 10:55:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 314BF60876; Wed, 30 Oct 2019 14:55:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82C5260872;
	Wed, 30 Oct 2019 14:55:32 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x9UEtVf5019869; 
	Wed, 30 Oct 2019 09:55:31 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x9UEtUg6019868;
	Wed, 30 Oct 2019 09:55:30 -0500
Date: Wed, 30 Oct 2019 09:55:30 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20191030145530.GO25414@octiron.msp.redhat.com>
References: <20191012212703.12989-1-martin.wilck@suse.com>
	<20191012212703.12989-68-martin.wilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20191012212703.12989-68-martin.wilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 67/72] multipath-tools: Makefile.inc: use -Wp,
 ... for compiling only
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: haVDjhXwNIymTYFy4AuiSg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sat, Oct 12, 2019 at 09:29:01PM +0000, Martin Wilck wrote:
> From: Martin Wilck <mwilck@suse.com>
>=20
> clang-3.9 errors out if -Wp,... preprocessor flags are used in the
> linking stage.
>=20
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  Makefile.inc | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/Makefile.inc b/Makefile.inc
> index d4d08fe9..f309a274 100644
> --- a/Makefile.inc
> +++ b/Makefile.inc
> @@ -96,9 +96,8 @@ OPTFLAGS=09=3D -O2 -g -pipe -Wall -Wextra -Wformat=3D2 =
-Werror=3Dimplicit-int \
>  =09=09  -Werror=3Dimplicit-function-declaration -Werror=3Dformat-securit=
y \
>  =09=09  -Wno-clobbered \
>  =09=09  -Werror=3Dcast-qual $(ERROR_DISCARDED_QUALIFIERS) \
> -=09=09  -Wp,-D_FORTIFY_SOURCE=3D2 $(STACKPROT) \
> -=09=09  --param=3Dssp-buffer-size=3D4
> -
> +=09=09  $(STACKPROT) --param=3Dssp-buffer-size=3D4
> +CPPFLAGS=09:=3D -Wp,-D_FORTIFY_SOURCE=3D2=20

Just a nit. The above line adds trailing whitespace.

-Ben

>  CFLAGS=09=09:=3D $(OPTFLAGS) -DBIN_DIR=3D\"$(bindir)\" -DLIB_STRING=3D\"=
${LIB}\" -DRUN_DIR=3D\"${RUN}\" \
>  =09=09   -MMD -MP $(CFLAGS)
>  BIN_CFLAGS=09=3D -fPIE -DPIE
> @@ -135,4 +134,4 @@ check_file =3D $(shell \
> =20
>  %.o:=09%.c
>  =09@echo building $@ because of $?
> -=09$(CC) $(CFLAGS) -c -o $@ $<
> +=09$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
> --=20
> 2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

