Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 48A7622008A
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 00:23:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594765409;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WzopsdvaCku0twxnxEftAhKaTs6myKbmjxcbgIeplSc=;
	b=YF8vzgTGjhfh2VgmDKcYUdX6VWPQY8S3V1UaBEc37QWa9n/dVFr8XKdPBM+SPvN/qZVL+U
	OWfRAArMTZcItYXSvCRMNp5vAx811psi4fI8NbXTqkv84I2OrZlyqWZ4P77+8pCpIt7YAa
	cYPulYyA+m3PyBO7hiTCMVf48UCHa8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-2DEEbYvZPIaqLlV14epx2w-1; Tue, 14 Jul 2020 18:23:27 -0400
X-MC-Unique: 2DEEbYvZPIaqLlV14epx2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3202C107ACCA;
	Tue, 14 Jul 2020 22:23:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09B2E10013D7;
	Tue, 14 Jul 2020 22:23:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E960180954D;
	Tue, 14 Jul 2020 22:23:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06EMMla0019354 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jul 2020 18:22:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C8B5797FC; Tue, 14 Jul 2020 22:22:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2717779CE3;
	Tue, 14 Jul 2020 22:22:44 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06EMMgrv006545; 
	Tue, 14 Jul 2020 17:22:42 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06EMMfdQ006544;
	Tue, 14 Jul 2020 17:22:41 -0500
Date: Tue, 14 Jul 2020 17:22:41 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200714222241.GK11089@octiron.msp.redhat.com>
References: <6eb10725-456f-de68-e927-1f5a9771c16c@huawei.com>
	<86d8307c-1747-2254-4f87-fac36f0d51ca@redhat.com>
	<0d26c9f6-4379-f201-a9a5-839bddef3f25@huawei.com>
	<92db2c49d0ddbbc385c6a14ef3d99a54457b908e.camel@suse.com>
	<b482dfdb-a40b-e523-1dcc-d37ddc4fc399@redhat.com>
	<f818352533682ae13fee17eb945fc2c9f62d15cd.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <f818352533682ae13fee17eb945fc2c9f62d15cd.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>, linfeilong@huawei.com,
	dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>,
	liuzhiqiang26@huawei.com, lutianxiong@huawei.com
Subject: Re: [dm-devel] [lvm-devel] master - multipathd: fix fd leak when
 iscsi device logs in
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jul 13, 2020 at 09:59:43PM +0200, Martin Wilck wrote:
> On Mon, 2020-07-13 at 11:56 +0200, Zdenek Kabelac wrote:
> > 
> > > @Zdenek, do we have to protect every libdm call, or is it
> > > sufficient
> > > to protect only dm_task_run(), as lixiaokeng suggested?
> > > 
> > 
> > Hi
> > 
> > It's actually hard to answer it in a simple way.
> > Several properties are held in library static variables.
> >
> > ...
> >
> > As for the issue of keeping control_fd open - there should be a
> > synchronized 
> > call of dm_hold_control_dev(0/1) -  see the codebase of  dmeventd.c
> > in lvm2 
> > code base - how we solve the control_fd handling.
> 
> I've made an assessment of the libdm calls that multipath-tools use.
> 
> Most of them are trivial getters and setters and need no locking,
> because they don't operate on any static or global data structures.
> 
> The exceptions I found are are listed here:
> 
> dm_driver_version
> dm_hold_control_dev
> dm_is_dm_major
> dm_lib_exit
> dm_lib_release
> dm_log_init
> dm_log_init_verbose
> dm_task_create
> dm_task_run
> dm_task_set_cookie
> dm_udev_set_sync_support
> dm_udev_wait
> 
> The reported race around _control_fd could probably be fixed simply
> by calling dm_hold_control_dev() and dm_driver_version() early on e.g.
> via pthread_once(), because dm_driver_version() calls dm_task_create()
> and dm_task_run(), and thus implicitly initializes the _control_fd.
> (libmultipath currently doesn't do these calls in the right order).
> This should also avoid the need for locking dm_is_dm_major() (access to
> _bitset) and dm_task_create (check_version()). The early init function
> could also call dm_log_init(), dm_log_init_verbose(), and
> dm_udev_set_sync_support(), setting up the libdm parameters once and
> for all.
> 
> However, there are other possible races, as you noted. Mainly related
> to manipulating the node_ops stack - this concerns dm_task_run(),
> dm_udev_wait(), dm_lib_release(), dm_lib_exit(). I'm uncertain about 
> dm_task_set_cookie(). I suppose it doesn't need protecting, but I tend
> to be on the safe side.
> 
> Anyway, that's my summary: the 4 or 5 functions mentioned in the
> previous paragraph would need wrapping under a lock. The rest can be
> handled by making sure the initialization is made early on, and only
> once.
> 
> Comments welcome.

We've agreed that dm_lib_release() is unnecessary, since we always call
dm_udev_wait() when update_devs() is needed. dm_lib_exit() should
already be safe, since we only call it after cleaning up the other
threads. dm_task_set_cookie() looks safe to me as well, assuming that we
have early initialization. So we are really talking about dm_task_run()
and dm_udev_wait(). Clearly dm_udev_wait() always needs to run under a
lock. Two threads trying to remove items from a list at the same time
isn't safe, and there's no way to know if there will be items on the
_node_ops list. The one thing I'm not sure of, is whether every call to
dm_task_run() always needs to be locked. clearly we could, and it would
be safer. Also, clearly for calls that add elements to _node_ops it
must. But for calls like DM_DEVICE_TABLE or DM_DEVICE_LIST, the only
issue that I can see with concurrent calls is the possibility that
_ioctl_buffer_double_factor gets increased too much. Perhaps that's
enough of a problem that we should just lock all dm_task_run() calls as
well.

-Ben
 
> Regards
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

