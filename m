Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 40F2937BFB8
	for <lists+dm-devel@lfdr.de>; Wed, 12 May 2021 16:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620829083;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CrWy/SmNWopfaBJkSf4mliU4HlIIbGTSFzbYi4GEvfA=;
	b=AJ7QVB4l7R7CnDIqJ8G0ezDEQQ0XzXur8lg2Z6eNfmasI2drUNfO9FVIszO2lLuq72LyOy
	R3ZAm6/L5bgUdwSmd5oMWmxCvbf098xRZ+SluDYfXMgyOXhv8pQHJvGkpbRZU8JqKiQh7G
	2JVqoXRdQnDnFDKkn73uwy5+QJsmwpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-XKaI2uT-NVWKnVbaPlY7Zw-1; Wed, 12 May 2021 10:17:59 -0400
X-MC-Unique: XKaI2uT-NVWKnVbaPlY7Zw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 266E61935780;
	Wed, 12 May 2021 14:17:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61DCE6091A;
	Wed, 12 May 2021 14:17:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E0DE1800BB0;
	Wed, 12 May 2021 14:17:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14CEHKft003813 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 May 2021 10:17:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A67662B0B3; Wed, 12 May 2021 14:17:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C8036091A;
	Wed, 12 May 2021 14:17:20 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14CEHIJi028789; 
	Wed, 12 May 2021 09:17:19 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14CEHIhI028788;
	Wed, 12 May 2021 09:17:18 -0500
Date: Wed, 12 May 2021 09:17:17 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210512141717.GD25887@octiron.msp.redhat.com>
References: <1620775324-23984-1-git-send-email-bmarzins@redhat.com>
	<1620775324-23984-2-git-send-email-bmarzins@redhat.com>
	<27a2802df2338186af82df84a027bc35f756ad00.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <27a2802df2338186af82df84a027bc35f756ad00.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/5] multipathd: don't fail to remove path
 once the map is removed
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 09:11:01AM +0000, Martin Wilck wrote:
> On Tue, 2021-05-11 at 18:22 -0500, Benjamin Marzinski wrote:
> > In ev_remove_path(), if update_mpp_paths() fails, we delete the
> > entire
> > map. However, since update_mpp_paths() happens before we call
> > set_path_removed(), pp->initialized isn't set to INIT_REMOVED, so
> > remove_map_and_stop_waiter() doesn't remove the path when in removes
> > the
> > map.=A0 But with the map removed, there's nothing to keep us from
> > removing
> > the path.
> >=20
> > Call set_path_removed() before update_mpp_paths() to avoid the odd
> > case
> > of ev_remove_path() removing the map but not the path.
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> > =A0libmultipath/structs_vec.c |=A0 3 +--
> > =A0multipathd/main.c=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 13 ++++++++-----
> > =A02 files changed, 9 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> > index d242c06b..432c0c63 100644
> > --- a/libmultipath/structs_vec.c
> > +++ b/libmultipath/structs_vec.c
> > @@ -45,8 +45,7 @@ int update_mpp_paths(struct multipath *mpp, vector
> > pathvec)
> > =A0
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0/*
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 * Avoid adding removed paths to the
> > map again
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 * when we reload it. Such paths may
> > exist if
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 * domap fails in ev_remove_path().
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 * when we reload it.
>=20
> I'd like to keep the remark about domap(). It's meant as a reminder for
> us and future developers how this situation is most likely to come to
> pass.

Sure. I just removed it, since we now call update_mpp_paths immediately
after calling set_path_removed(), so it seemed more obvious that we will
run into this situation than it did before, when it only happened if we
first failed in ev_remove_path(). I'm fine with putting it back.

>=20
> Other than that, ACK.
>=20
> Regards,
> Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

