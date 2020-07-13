Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2F62021E110
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 22:00:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-3UzKg2rVOd-uW956Vpt7bg-1; Mon, 13 Jul 2020 16:00:02 -0400
X-MC-Unique: 3UzKg2rVOd-uW956Vpt7bg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02D6A10A85A1;
	Mon, 13 Jul 2020 19:59:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A52651992D;
	Mon, 13 Jul 2020 19:59:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0FBC180954D;
	Mon, 13 Jul 2020 19:59:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DJxpEU020970 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 15:59:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8E8ECF617; Mon, 13 Jul 2020 19:59:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4D28B078B
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 19:59:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E713F8007B1
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 19:59:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-407-qxd2ZOEnOLqbAjKaiPpt6Q-1;
	Mon, 13 Jul 2020 15:59:46 -0400
X-MC-Unique: qxd2ZOEnOLqbAjKaiPpt6Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DEE7FB1FA;
	Mon, 13 Jul 2020 19:59:46 +0000 (UTC)
Message-ID: <f818352533682ae13fee17eb945fc2c9f62d15cd.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zdenek Kabelac <zkabelac@redhat.com>, lixiaokeng <lixiaokeng@huawei.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 13 Jul 2020 21:59:43 +0200
In-Reply-To: <b482dfdb-a40b-e523-1dcc-d37ddc4fc399@redhat.com>
References: <6eb10725-456f-de68-e927-1f5a9771c16c@huawei.com>
	<86d8307c-1747-2254-4f87-fac36f0d51ca@redhat.com>
	<0d26c9f6-4379-f201-a9a5-839bddef3f25@huawei.com>
	<92db2c49d0ddbbc385c6a14ef3d99a54457b908e.camel@suse.com>
	<b482dfdb-a40b-e523-1dcc-d37ddc4fc399@redhat.com>
User-Agent: Evolution 3.36.3
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, dm-devel@redhat.com, liuzhiqiang26@huawei.com,
	lutianxiong@huawei.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-13 at 11:56 +0200, Zdenek Kabelac wrote:
> 
> > @Zdenek, do we have to protect every libdm call, or is it
> > sufficient
> > to protect only dm_task_run(), as lixiaokeng suggested?
> > 
> 
> Hi
> 
> It's actually hard to answer it in a simple way.
> Several properties are held in library static variables.
>
> ...
>
> As for the issue of keeping control_fd open - there should be a
> synchronized 
> call of dm_hold_control_dev(0/1) -  see the codebase of  dmeventd.c
> in lvm2 
> code base - how we solve the control_fd handling.

I've made an assessment of the libdm calls that multipath-tools use.

Most of them are trivial getters and setters and need no locking,
because they don't operate on any static or global data structures.

The exceptions I found are are listed here:

dm_driver_version
dm_hold_control_dev
dm_is_dm_major
dm_lib_exit
dm_lib_release
dm_log_init
dm_log_init_verbose
dm_task_create
dm_task_run
dm_task_set_cookie
dm_udev_set_sync_support
dm_udev_wait

The reported race around _control_fd could probably be fixed simply
by calling dm_hold_control_dev() and dm_driver_version() early on e.g.
via pthread_once(), because dm_driver_version() calls dm_task_create()
and dm_task_run(), and thus implicitly initializes the _control_fd.
(libmultipath currently doesn't do these calls in the right order).
This should also avoid the need for locking dm_is_dm_major() (access to
_bitset) and dm_task_create (check_version()). The early init function
could also call dm_log_init(), dm_log_init_verbose(), and
dm_udev_set_sync_support(), setting up the libdm parameters once and
for all.

However, there are other possible races, as you noted. Mainly related
to manipulating the node_ops stack - this concerns dm_task_run(),
dm_udev_wait(), dm_lib_release(), dm_lib_exit(). I'm uncertain about 
dm_task_set_cookie(). I suppose it doesn't need protecting, but I tend
to be on the safe side.

Anyway, that's my summary: the 4 or 5 functions mentioned in the
previous paragraph would need wrapping under a lock. The rest can be
handled by making sure the initialization is made early on, and only
once.

Comments welcome.

Regards
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

