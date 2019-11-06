Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C9DC9F201D
	for <lists+dm-devel@lfdr.de>; Wed,  6 Nov 2019 21:51:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573073518;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wh48XA/eh0el//0Q0K7W+RPfAjmSu8sOgpGhdB1hbp4=;
	b=GQrm8A3IiH/pt8AlOoiNqNU1l+ro6m19NE3/86cqHLoTd5fsp9IjNxG3SzVVqWWzB2Q+FN
	8OQ8v6OkvfRa+OfunlAzJtbyRRyGo9dFSP3EdtRkr16gJjtxxZL45AF0nAsTrozSpW3xIg
	VabspLGRa9GXREqrmE/8aQ7P/C71l6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-5I2FVQ3JPbau5_n6lkAKtA-1; Wed, 06 Nov 2019 15:51:56 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B023A107ACC3;
	Wed,  6 Nov 2019 20:51:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E3445D6A7;
	Wed,  6 Nov 2019 20:51:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C578D18089C8;
	Wed,  6 Nov 2019 20:51:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA6KpKtc030471 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 6 Nov 2019 15:51:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 746A1600CD; Wed,  6 Nov 2019 20:51:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 247E3600C4;
	Wed,  6 Nov 2019 20:51:17 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id xA6KpFQX022898; 
	Wed, 6 Nov 2019 14:51:15 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id xA6KpEhT022897;
	Wed, 6 Nov 2019 14:51:14 -0600
Date: Wed, 6 Nov 2019 14:51:14 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20191106205114.GA30153@octiron.msp.redhat.com>
References: <20191012212703.12989-1-martin.wilck@suse.com>
	<20191012212703.12989-17-martin.wilck@suse.com>
	<20191030145333.GN25414@octiron.msp.redhat.com>
	<1dafb5da296c6eec383213ec04dcf399fe45c0f6.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <1dafb5da296c6eec383213ec04dcf399fe45c0f6.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 16/72] libmultipath: make path_discovery()
 pthread_cancel()-safe
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 5I2FVQ3JPbau5_n6lkAKtA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Nov 04, 2019 at 08:29:21AM +0000, Martin Wilck wrote:
> Hi Ben,
>=20
> thanks for looking into this.
>=20
> On Wed, 2019-10-30 at 09:53 -0500, Benjamin Marzinski wrote:
> > On Sat, Oct 12, 2019 at 09:27:57PM +0000, Martin Wilck wrote:
> > > From: Martin Wilck <mwilck@suse.com>
> > >=20
> > > The udev_enumerate and udev_device refs wouldn't be released
> > > if the thread was cancelled. Fix it.
> > >=20
> > > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > > ---
> > >  libmultipath/discovery.c | 51 +++++++++++++++++++++++++++++++-----
> > > ----
> > >  1 file changed, 40 insertions(+), 11 deletions(-)
> > >=20
> > > diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> > > index e68b0e9f..d217ca92 100644
> > > --- a/libmultipath/discovery.c
> > > +++ b/libmultipath/discovery.c
> > > @@ -140,19 +140,47 @@ path_discover (vector pathvec, struct config
> > > * conf,
> > >  =09return pathinfo(pp, conf, flag);
> > >  }
> > > =20
> > > +static void cleanup_udev_enumerate_ptr(void *arg)
> > > +{
> > > +=09struct udev_enumerate *ue;
> > > +
> > > +=09if (!arg)
> > > +=09=09return;
> > > +=09ue =3D *((struct udev_enumerate**) arg);
> > > +=09if (ue)
> > > +=09=09(void)udev_enumerate_unref(ue);
> > > +}
> > > +
> > > +static void cleanup_udev_device_ptr(void *arg)
> > > +{
> > > +=09struct udev_device *ud;
> > > +
> > > +=09if (!arg)
> > > +=09=09return;
> > > +=09ud =3D *((struct udev_device**) arg);
> > > +=09if (ud)
> > > +=09=09(void)udev_device_unref(ud);
> > > +}
> > > +
> > >  int
> > >  path_discovery (vector pathvec, int flag)
> > >  {
> > > -=09struct udev_enumerate *udev_iter;
> > > +=09struct udev_enumerate *udev_iter =3D NULL;
> > >  =09struct udev_list_entry *entry;
> > > -=09struct udev_device *udevice;
> > > +=09struct udev_device *udevice =3D NULL;
> > >  =09struct config *conf;
> > > -=09const char *devpath;
> > >  =09int num_paths =3D 0, total_paths =3D 0, ret;
> > > =20
> > > +=09pthread_cleanup_push(cleanup_udev_enumerate_ptr, &udev_iter);
> > > +=09pthread_cleanup_push(cleanup_udev_device_ptr, &udevice);
> > > +=09conf =3D get_multipath_config();
> > > +=09pthread_cleanup_push(put_multipath_config, conf);
> > > +
> > >  =09udev_iter =3D udev_enumerate_new(udev);
> > > -=09if (!udev_iter)
> > > -=09=09return -ENOMEM;
> > > +=09if (!udev_iter) {
> > > +=09=09ret =3D -ENOMEM;
> > > +=09=09goto out;
> > > +=09}
> > > =20
> > >  =09if (udev_enumerate_add_match_subsystem(udev_iter, "block") < 0
> > > ||
> > >  =09    udev_enumerate_add_match_is_initialized(udev_iter) < 0 ||
> > > @@ -165,6 +193,8 @@ path_discovery (vector pathvec, int flag)
> > >  =09udev_list_entry_foreach(entry,
> > >  =09=09=09=09udev_enumerate_get_list_entry(udev_iter
> > > )) {
> > >  =09=09const char *devtype;
> > > +=09=09const char *devpath;
> > > +
> > >  =09=09devpath =3D udev_list_entry_get_name(entry);
> > >  =09=09condlog(4, "Discover device %s", devpath);
> > >  =09=09udevice =3D udev_device_new_from_syspath(udev, devpath);
> > > @@ -175,19 +205,18 @@ path_discovery (vector pathvec, int flag)
> > >  =09=09devtype =3D udev_device_get_devtype(udevice);
> > >  =09=09if(devtype && !strncmp(devtype, "disk", 4)) {
> > >  =09=09=09total_paths++;
> > > -=09=09=09conf =3D get_multipath_config();
> > > -=09=09=09pthread_cleanup_push(put_multipath_config,
> > > conf);
> >=20
> > Why move grabbing the config RCU lock out of the loop?=20
>=20
> Yes, that was the idea.
>=20
> > All things being
> > equal, it seems like we'd rather hold this for less time, and
> > rcu_read_lock() is designed to be lightweight, so calling it more
> > times
> > shouldn't be an issue.=20
>=20
> It's not the execution time of rcu_read_lock() that I'm concerned
> about.=20
>=20
> In this particular loop, my estimate is that >90% of time is spent in
> path_discover()/pathinfo(), so time-during-which-lock-is-held-wise, we
> gain little by taking and releasing the RCU lock in every iteration.=20
>=20
> Right, we might catch a configuration change _earlier_ if we release
> the lock between pathinfo() invocations. But - do we actually want
> that? This lock protects us against corruption of the multipathd
> configuration, basically against someone calling "multipathd
> reconfigure" while our code is running. But if the configuration ins
> really changed, what we're currently doing is vain anyway - once the
> configure() call is finished, we will go through yet another full
> reconfigure cycle. IOW: Do we seriously want to call pathinfo() for the
> different paths in the system with  different configuration, once with
> and once without "user_friendly_names", for example?
>=20
> Given that the code we're talking about is only called from
> reconfigure(), multipath_conf having just been reassigned, IMO it's an
> improvement to hold the lock through the entire loop. It might even be
> good to hold the lock for the complete invocation of configure(), but I
> haven't thought about that in detail yet.
>=20
> Does this make sense?

Sure. ACK

-Ben
=20
> Besides, to my taste at least, it improves readability of the code to
> move get_multipath_config() out of certain loops.
>=20
> Thanks,
> Martin
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

