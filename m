Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C5BB637D584
	for <lists+dm-devel@lfdr.de>; Wed, 12 May 2021 23:53:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620856401;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x02AoLxrV6qar7gSMrL2NF0wmQud198Tw/Q7tq9ZvTI=;
	b=RhBMJ23dZN951Igr2pe5XOlE9nrWaxpiyYZaXX0YliPzOO/CTZZmkCp8JUeUOVFNdSJAyf
	+W87+W8rizhcDa0M5x4nYwgTNeb8zpDWnkM4Tf3dQ016ye4ZcU8bpzpmX/Fr+kLhsA+pJ6
	YOXVOhkoRvDFTJ9Fi5DsBsNiPcnzvzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-jGf_lJLhP3-6ybcNldKjVw-1; Wed, 12 May 2021 17:53:19 -0400
X-MC-Unique: jGf_lJLhP3-6ybcNldKjVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DAEE1854E24;
	Wed, 12 May 2021 21:53:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF14710074E5;
	Wed, 12 May 2021 21:53:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82EA81800BB0;
	Wed, 12 May 2021 21:53:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14CLqsBH023967 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 May 2021 17:52:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D50191037E81; Wed, 12 May 2021 21:52:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E18C10074E5;
	Wed, 12 May 2021 21:52:51 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14CLqnjU005263; 
	Wed, 12 May 2021 16:52:49 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14CLqnYP005262;
	Wed, 12 May 2021 16:52:49 -0500
Date: Wed, 12 May 2021 16:52:48 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210512215248.GG25887@octiron.msp.redhat.com>
References: <1620775324-23984-1-git-send-email-bmarzins@redhat.com>
	<1620775324-23984-4-git-send-email-bmarzins@redhat.com>
	<66c4ca02bb90a7a4c18819082d2ec554ddc56205.camel@suse.com>
	<20210512195305.GE25887@octiron.msp.redhat.com>
	<7e6fb44f90e6088f53a41396a7e210cd3009d469.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <7e6fb44f90e6088f53a41396a7e210cd3009d469.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/5] multipathd: make ev_remove_path return
 success on path removal
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 08:36:49PM +0000, Martin Wilck wrote:
> On Wed, 2021-05-12 at 14:53 -0500, Benjamin Marzinski wrote:
> > On Wed, May 12, 2021 at 11:38:08AM +0000, Martin Wilck wrote:
> > > On Tue, 2021-05-11 at 18:22 -0500, Benjamin Marzinski wrote:
> > So AFAICS, the only way for a path not to get removed is if you
> > succeed
> > with wait_for_udev or !need_do_map, or if you fail in domap.
>=20
> Agreed. Let's fix these comments.

Yep.
=20
> >  Since wait_for_udev can happen in more situations,
> > it's a lot harder to say what the right answer is. For cli_add_path
> > and
> > uev_add_path, it seems like we want to know if the path was really
> > removed. So returning failure there makes sense.=A0 For cli_del_path
> > and
> > uev_remove_path, it seems like we want to avoid spurious error
> > messages
> > when everything went alright and we're just waiting to update the
> > map.
> > So returning success makes sense there.
> >=20
> > Perhaps the answer is to return symbolic values, to describe what
> > actually happened, rather than success or failure.
>=20
> This is what I meant. I didn't express myself clearly enough; I just
> thought that 0 doesn't have to mean "success".
>=20

Sure. I'll add symbolic returns.

>=20
> I think the callers just need to know if the path is still referenced
> somewhere. Acting appropriately is then up to the caller. You just
> proved that my cases a) and b) are actually equivalent, which is nice.
> Perhaps we need to introduce another return code indicating that the
> entire map had been removed (e.g. failure in setup_multipath()).

The more important return to me seems to be an indication of whether the
remove has been delayed.  For uev_remove_path(), you don't want to
return failure just because the remove has been delayed. Otherwise there
will be spurious error messages in the logs. cli_del_path is a little
trickier.  My biggest question with that is whether it would mess with
people's scripts to add a reply message saying what happened. It seems
like it should only fail if domap failed. But it would be nice to tell
the user that the remove has been delayed, or that the map couldn't be
reloaded and was removed as well.=20

> > > However, this goes beyond the purpose of your patch. *If* we remove
> > > the
> > > map, returning 0 is correct for either a) or b).
> > >=20
> > > P.S. 2: I wonder if the logic in uev_update_path() is correct.
> > > Rather
> > > than calling uev_add_path() after rescan_path() directly, I think
> > > we
> > > should rather wait for another uevent (and possibly trigger another
> > > "add" event, I don't think "rescan" automatically generates one).
> > >=20
> >=20
> > Yep. You're correct. I'll fix that.

Actually, I take it back. The code seems to work o.k. as is. The
uev_update_path() code checks if get_uid() now returns a different
value, instead of using get_vpd_sgio() like the recheck_wwid code does.
This means that the uid_attribute must have already gotten updated when
rescan_path() is called. So my real question is "is there any real
benefit to calling rescan_path() at all here". This code seemed to be
working correctly before we added it, except in the case where
uid_attribute wasn't getting updated (which recheck_wwid now will
hopefully catch).

If there is a benefit, then we have to be careful to only call it once.
Otherwise, we could get stuck in an endless loop where we trigger an add
uevent, which in turn triggers another add uevent, and so on.

-Ben
=20
> > -Ben
> >=20
> > >=20
> > > > ---
> > > > =A0multipathd/main.c | 6 ++++--
> > > > =A01 file changed, 4 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/multipathd/main.c b/multipathd/main.c
> > > > index 6090434c..4bdf14bd 100644
> > > > --- a/multipathd/main.c
> > > > +++ b/multipathd/main.c
> > > > @@ -1284,7 +1284,7 @@ ev_remove_path (struct path *pp, struct
> > > > vectors *
> > > > vecs, int need_do_map)
> > > > =A0
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0strlcpy(devt, pp->dev_t, sizeof(devt));
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0if (setup_multipath(vecs, mpp))
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0return 1;
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0return 0;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0/*
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 * Successful map reload without this
> > > > path:
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 * sync_map_state() will free it.
> > > > @@ -1304,8 +1304,10 @@ out:
> > > > =A0=A0=A0=A0=A0=A0=A0=A0return retval;
> > > > =A0
> > > > =A0fail:
> > > > +=A0=A0=A0=A0=A0=A0=A0condlog(0, "%s: error removing path. removing=
 map %s",
> > > > pp->dev,
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0mpp->alias);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0remove_map_and_stop_waiter(mpp, vecs);
> > > > -=A0=A0=A0=A0=A0=A0=A0return 1;
> > > > +=A0=A0=A0=A0=A0=A0=A0return 0;
> > > > =A0}
> > > > =A0
> > > > =A0static int
> >=20
> > --
> > dm-devel mailing list
> > dm-devel@redhat.com
> > https://listman.redhat.com/mailman/listinfo/dm-devel
> >=20

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

