Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA0F221398
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 19:42:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-4CIiQkm3Oz-p5xLKtP5WWw-1; Wed, 15 Jul 2020 13:42:01 -0400
X-MC-Unique: 4CIiQkm3Oz-p5xLKtP5WWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97B3B1080;
	Wed, 15 Jul 2020 17:41:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AF6C5C1BD;
	Wed, 15 Jul 2020 17:41:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56D08180954D;
	Wed, 15 Jul 2020 17:41:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06FHfVkl004824 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 13:41:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 87F7910EE79C; Wed, 15 Jul 2020 17:41:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8213910073CD
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 17:41:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C0B28007CD
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 17:41:29 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-397-syApDfGgMvqKV7FYHh0ryA-1;
	Wed, 15 Jul 2020 13:41:26 -0400
X-MC-Unique: syApDfGgMvqKV7FYHh0ryA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 900D8B174;
	Wed, 15 Jul 2020 17:41:28 +0000 (UTC)
Message-ID: <1943423d8efe0deac64595f71bb56e06b52cdd7c.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 15 Jul 2020 19:41:24 +0200
In-Reply-To: <20200714222241.GK11089@octiron.msp.redhat.com>
References: <6eb10725-456f-de68-e927-1f5a9771c16c@huawei.com>
	<86d8307c-1747-2254-4f87-fac36f0d51ca@redhat.com>
	<0d26c9f6-4379-f201-a9a5-839bddef3f25@huawei.com>
	<92db2c49d0ddbbc385c6a14ef3d99a54457b908e.camel@suse.com>
	<b482dfdb-a40b-e523-1dcc-d37ddc4fc399@redhat.com>
	<f818352533682ae13fee17eb945fc2c9f62d15cd.camel@suse.com>
	<20200714222241.GK11089@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.3
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>, linfeilong@huawei.com,
	dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>,
	liuzhiqiang26@huawei.com, lutianxiong@huawei.com
Subject: Re: [dm-devel] master - multipathd: fix fd leak when iscsi device
	logs in
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-07-14 at 17:22 -0500, Benjamin Marzinski wrote:
> On Mon, Jul 13, 2020 at 09:59:43PM +0200, Martin Wilck wrote:
> > Comments welcome.
> 
> We've agreed that dm_lib_release() is unnecessary, since we always
> call
> dm_udev_wait() when update_devs() is needed. dm_lib_exit() should
> already be safe, since we only call it after cleaning up the other
> threads. dm_task_set_cookie() looks safe to me as well, assuming that
> we
> have early initialization. So we are really talking about
> dm_task_run()
> and dm_udev_wait(). Clearly dm_udev_wait() always needs to run under
> a
> lock. Two threads trying to remove items from a list at the same time
> isn't safe, and there's no way to know if there will be items on the
> _node_ops list. The one thing I'm not sure of, is whether every call
> to
> dm_task_run() always needs to be locked. clearly we could, and it
> would
> be safer. Also, clearly for calls that add elements to _node_ops it
> must. But for calls like DM_DEVICE_TABLE or DM_DEVICE_LIST, the only
> issue that I can see with concurrent calls is the possibility that
> _ioctl_buffer_double_factor gets increased too much. Perhaps that's
> enough of a problem that we should just lock all dm_task_run() calls
> as
> well.

Yes. We shouldn't try to be too smart. It's easier to verify that every
call is wrapped under a lock than to figure out later whether we made
the case distinction right.

So, action plan:

 - remove dm_lib_release() calls
 - Combine all possibly racy calls related to libdm initialization in
   some early init call, protected by pthread_once()
 - make sure dm_lib_exit() is handled correctly
 - add locking around dm_task_run() and dm_udev_wait()

Regards
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

