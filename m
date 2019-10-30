Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 697F4E9E34
	for <lists+dm-devel@lfdr.de>; Wed, 30 Oct 2019 16:01:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572447692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yqlZXfQ9I4Hyes07gEOPr6v6rQcZK5X50oDyhppPU2I=;
	b=Tt6fsHwtniZehKyar5eeGImPzpN0wMJoAeMPxKgHcjI0fpFUWJc8Je6JLb3rhPzmeQwse+
	cT4bDkH3H3fyWEh4/CO1VZEU06DTFkVF9fRGh4fRtflJxMPkUBBj+tiON5nrDTwGUSzLYQ
	Q5W84VpP1WlWnCjwp8SoUVsobWKv40M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-6vIWx643OjiOo0eO11cBlw-1; Wed, 30 Oct 2019 11:01:27 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BAE51005502;
	Wed, 30 Oct 2019 15:01:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA96C1001B39;
	Wed, 30 Oct 2019 15:01:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C85A4BB5B;
	Wed, 30 Oct 2019 15:01:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9UElMHq011165 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 30 Oct 2019 10:47:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2E33560870; Wed, 30 Oct 2019 14:47:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 986A760872;
	Wed, 30 Oct 2019 14:47:19 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x9UElIq4019835; 
	Wed, 30 Oct 2019 09:47:18 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x9UElHqi019834;
	Wed, 30 Oct 2019 09:47:17 -0500
Date: Wed, 30 Oct 2019 09:47:16 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20191030144716.GM25414@octiron.msp.redhat.com>
References: <20191012212703.12989-1-martin.wilck@suse.com>
	<20191012212703.12989-14-martin.wilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20191012212703.12989-14-martin.wilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 13/72] libmultipath: alias.c: prepare for
 cancel-safe allocation
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
X-MC-Unique: 6vIWx643OjiOo0eO11cBlw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sat, Oct 12, 2019 at 09:27:53PM +0000, Martin Wilck wrote:
> From: Martin Wilck <mwilck@suse.com>
>=20
> In functions that return newly allocated memory, avoid cancellation
> points before returning, and if that's not possible, guard the code
> that contains cancellation points with a cleanup function calling
> free(), and immediately before returning, call pthread_cleanup_pop(0).

This is certainly an improvement. But if we're worried about leaking
memory from a cancellation during this function, shouldn't we be equally
worried about leaking the open file.

-Ben

>=20
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/alias.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>=20
> diff --git a/libmultipath/alias.c b/libmultipath/alias.c
> index 15bbc8ed..0fc9e542 100644
> --- a/libmultipath/alias.c
> +++ b/libmultipath/alias.c
> @@ -268,13 +268,12 @@ allocate_binding(int fd, const char *wwid, int id, =
const char *prefix)
>  =09c =3D strchr(buf, ' ');
>  =09if (c)
>  =09=09*c =3D '\0';
> +
> +=09condlog(3, "Created new binding [%s] for WWID [%s]", buf, wwid);
>  =09alias =3D strdup(buf);
>  =09if (alias =3D=3D NULL)
> -=09=09condlog(0, "cannot copy new alias from bindings file : %s",
> -=09=09=09strerror(errno));
> -=09else
> -=09=09condlog(3, "Created new binding [%s] for WWID [%s]", alias,
> -=09=09=09wwid);
> +=09=09condlog(0, "cannot copy new alias from bindings file: out of memor=
y");
> +
>  =09return alias;
>  }
> =20
> @@ -342,7 +341,9 @@ use_existing_alias (const char *wwid, const char *fil=
e, const char *alias_old,
>  =09}
> =20
>  out:
> +=09pthread_cleanup_push(free, alias);
>  =09fclose(f);
> +=09pthread_cleanup_pop(0);
>  =09return alias;
>  }
> =20
> @@ -378,18 +379,19 @@ get_user_friendly_alias(const char *wwid, const cha=
r *file, const char *prefix,
>  =09=09return NULL;
>  =09}
> =20
> +=09pthread_cleanup_push(free, alias);
> +
>  =09if (fflush(f) !=3D 0) {
>  =09=09condlog(0, "cannot fflush bindings file stream : %s",
>  =09=09=09strerror(errno));
>  =09=09free(alias);
> -=09=09fclose(f);
> -=09=09return NULL;
> -=09}
> -
> -=09if (can_write && !bindings_read_only && !alias)
> +=09=09alias =3D NULL;
> +=09} else if (can_write && !bindings_read_only && !alias)
>  =09=09alias =3D allocate_binding(fd, wwid, id, prefix);
> =20
>  =09fclose(f);
> +
> +=09pthread_cleanup_pop(0);
>  =09return alias;
>  }
> =20
> --=20
> 2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

