Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 901802445FC
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:51:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-e9KnySckO2CsmX4nNbYQkQ-1; Fri, 14 Aug 2020 03:51:31 -0400
X-MC-Unique: e9KnySckO2CsmX4nNbYQkQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2810B802B47;
	Fri, 14 Aug 2020 07:51:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9F945C1BD;
	Fri, 14 Aug 2020 07:51:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10B334EE14;
	Fri, 14 Aug 2020 07:51:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07E7mlJr012203 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 14 Aug 2020 03:48:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 054712022799; Fri, 14 Aug 2020 07:48:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 015332022793
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 07:48:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D98A985A5A5
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 07:48:43 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-263-b3MwEmkkPQ-9bVdqvTQY4g-1;
	Fri, 14 Aug 2020 03:48:39 -0400
X-MC-Unique: b3MwEmkkPQ-9bVdqvTQY4g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5C4DFAB9F;
	Fri, 14 Aug 2020 07:49:00 +0000 (UTC)
Message-ID: <c8468d0333f188f652de5c437baf91978ffcd432.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 14 Aug 2020 09:48:36 +0200
In-Reply-To: <20200813222359.GY19233@octiron.msp.redhat.com>
References: <20200812113405.26206-1-mwilck@suse.com>
	<20200812113405.26206-3-mwilck@suse.com>
	<20200813222359.GY19233@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 41/42] libmultipath: refuse reloading an
 existing map with different WWID
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Ben,

On Thu, 2020-08-13 at 17:23 -0500, Benjamin Marzinski wrote:
> On Wed, Aug 12, 2020 at 01:34:05PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > If a map with given name (alias) already exists with a different
> > WWID,
> > reloading it with a new WWID is harmful. The existing paths would
> > first
> > be replaced by others with the new WWID. The WWIDs of the new paths
> > wouldn't
> > match the map WWID; thus the next time the map is disassembled, the
> > (correct)
> > path WWIDs would be overwritten by the different map WWID (with
> > subsequent
> > patches from this series, they'd be orphaned instead, which is
> > better but
> > still not ideal). When the map is reloaded later, paths with
> > diffent WWIDs
> > may be mixed, causing data corruption.
> > 
> > Refuse reloading a map under such circumstances.
> > 
> > Note: this patch doesn't change multipath-tools behavior in the
> > case
> > where valid map aliases are supposed to be swapped (typically if
> > the bindings
> > file differs between initrd and root FS). In this case,
> > select_action()
> > selects ACT_RENAME, which this patch doesn't affect. The user-
> > visible behavior
> > in this case remains as-is: the map renames fail, and the aliases
> > remain
> > unchanged, thus not matching the current bindings file, but art
> > least
> > internally consistent.
> > 
> > To fully fix this use case, coalesce_paths() must cease setting up
> > maps one
> > by one. Instead, we'd need to build up a full set of maps-to-be-
> > set-up,
> > and create them in a single batch, figuring out a "rename strategy"
> > beforehand
> > to avoid clashes between existing and to-be-created maps (for
> > example,
> > a name swap A<->B would need to be carried out as B->tmp, A->B,
> > tmp->A).
> > Implementing that is out of the scope of this patch series.
> > 
> 
> We need to do something about this, and this is an easy stop-gap, so
> I'm
> fine with this patch.  However it might be better check if we can
> fall
> back to using the wwid for the alias (we should always be able to,
> unless people pick really bad aliases in /etc/multipath.conf). This
> will
> allow us to create the device.  It can always get renamed later, and
> all
> things being equal, it seems better to have a device with a wwid
> alias,
> than to have no device at all.

Patch 80 from my series basically does that. There's currently no check
whether some other map mistakenly uses that WWID as alias, though.

> 
> Also, I do wonder if we can't still setup devices one at a time.  As
> long as we agree that it is unsupported to configure multipath so
> that
> two devices have the same alias or to configure a device with an
> alias
> that matches another device's wwid, and that we can't guarantee what
> the
> devices will be named in that case (or even that there names won't
> change when commands are run), it seems doable.

There are potential conflicts in two directions: 1) with the future,
to-be-set-up set of maps, and 2) with the current, existing maps. This
is problematic per se, because it creates more apparent conflicts than
actually exist. The current code looks almost exclusively at conflicts
of type 2), but I think what actually matters more is type 1).

If we didn't set up one by one, we could examine the "future" setup for
possible conflicts, and ignore conflicts with the existing setup
entirely, except for calculating a setup strategy / ordering that would
avoid conflicts "on the way".

When we set up one by one, it gets even worse because 1) is only
partially known while we set up the maps. When we set up a map, we
simply don't know which alias other maps we are yet going to set up
will be configured to have. Both false positives and false negatives
are possible. My attempt to take conflicts of type 1) into account in
the v1 series was incorrect and rightfully rejected by you.

> If we are reloading all the devices, and there is an A<->B alias
> swap,
> when we reload A (assume that's the first one we see, with a wwid of
> WWID1) we notice that there already is an existing device named B
> (with
> a wwid of WWID2). Before continuing with the reload of A, we reanme B
> to
> WWID2 (which should work. If not we refuse the reload of A). When we
> later get to the device now named WWID2, we can rename it to A.

This is one possible approach, yes. Indeed I considered a more radical
idea, renaming *all* maps to either WWID or random names before trying
to set up the final set of maps. That would avoid name clashes "on the
way" by definition, and avoid rename-specific error handling. But it
would issue a lot of unnecessary rename ioctls.

The other option would be bulk renaming with a pre-calculated renaming
strategy. I believe there two basic renaming sequences, one being a
"linear" sequence A->B->C->...->X-><N>, where <N> is a previously
unused alias, and one A->B->C->...->X->A (cycle; the swap is a special
case of the cycle). The linear case can be resolved easily be renaming
backwards. The cycle must first be "cut open" e.g. by renaming X->tmp;
then treated like linear, and finally tmp->A. The code would need to
identify these sequences, and figure out a sequence of renames that
would avoid conflicts with existing maps. This solution uses a minimal
number of renames, and would generally be the cleanest IMO. But it also
requires most thought and coding effort.

[ Something makes me feel we're tackling a solved problem here, I have
  a vague recollection of past issues with ethernet device renaming ...
  :-/ ]

> If we are only reloading a single device, I'm fine with failing, with
> a
> message telling the user to reload all devices to fix the issue. I'm
> also open to convinced that it would be o.k. to rename a device that
> we
> weren't planing on reloading, because it has a wrong alias, which
> messes
> with the device that we were supposed to reload (I assume this makes
> the
> code easier). Does that sound like a reasonable solution?

I sounds ok. But my experiments with the different patches have come
with various surprises to me, where the code behaved differently than I
had expected. The current logic is complex, split over different
functions (coalesce_paths(), select_alias(), select_action(), domap()),
and hard to follow for the reasons I described above. What you describe
here would add yet another special case with special treatment. Some
time in the future I'd like to see a clear and well-defined logic
executed in a reproducible manner.

Thanks for the review,
Martin

>  
> Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > ---
> >  libmultipath/configure.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/libmultipath/configure.c b/libmultipath/configure.c
> > index 315eb6a..5f60f74 100644
> > --- a/libmultipath/configure.c
> > +++ b/libmultipath/configure.c
> > @@ -897,10 +897,21 @@ int domap(struct multipath *mpp, char
> > *params, int is_daemon)
> >  		return DOMAP_DRY;
> >  	}
> >  
> > -	if (mpp->action == ACT_CREATE &&
> > -	    dm_map_present(mpp->alias)) {
> > -		condlog(3, "%s: map already present", mpp->alias);
> > -		mpp->action = ACT_RELOAD;
> > +	if (mpp->action == ACT_CREATE && dm_map_present(mpp->alias)) {
> > +		char wwid[WWID_SIZE];
> > +
> > +		if (dm_get_uuid(mpp->alias, wwid, sizeof(wwid)) == 0) {
> > +			if (!strncmp(mpp->wwid, wwid, sizeof(wwid))) {
> > +				condlog(3, "%s: map already present",
> > +					mpp->alias);
> > +				mpp->action = ACT_RELOAD;
> > +			} else {
> > +				condlog(0, "%s: map \"%s\" already
> > present with WWID %s, skipping",
> > +					mpp->wwid, mpp->alias, wwid);
> > +				condlog(0, "please check alias settings
> > in config and bindings file");
> > +				mpp->action = ACT_REJECT;
> > +			}
> > +		}
> >  	}
> >  
> >  	switch (mpp->action) {
> > -- 
> > 2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

