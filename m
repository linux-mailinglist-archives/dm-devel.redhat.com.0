Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id B26E3190B9F
	for <lists+dm-devel@lfdr.de>; Tue, 24 Mar 2020 11:58:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585047537;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3P530bJ+rz/eLB2oO1CeUvCI2V2XG5CKQXnsvecjhvg=;
	b=C/wtRzbpE++uIlTnDdxQZESvxsGqPLFC0GM02Bw1sX5ZQh9LJ/HMqT6J6RdaeyU50EcFWD
	wM7IH6Ecn6TXmfvlkpRTiRalZCJOhZzxEhQ+kYrF0uUemdtGq2eSjA9bLsnC8otomH1/h1
	tyASStcWsCawOt1NcQL2ld7ZSnm9NOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-K8L0qsz9M5Gzk0SuuPUu5w-1; Tue, 24 Mar 2020 06:58:55 -0400
X-MC-Unique: K8L0qsz9M5Gzk0SuuPUu5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C4BF881D2B;
	Tue, 24 Mar 2020 10:58:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4734CCDBC0;
	Tue, 24 Mar 2020 10:58:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2FB6486382;
	Tue, 24 Mar 2020 10:58:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02OAwL6B008513 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 06:58:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 182612063FE5; Tue, 24 Mar 2020 10:58:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1371D2063FE6
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 10:58:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76CF58F7830
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 10:58:18 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-312-e5uPyHJgMc22b3Exu5qZeQ-1;
	Tue, 24 Mar 2020 06:58:16 -0400
X-MC-Unique: e5uPyHJgMc22b3Exu5qZeQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 27AEAAA7C;
	Tue, 24 Mar 2020 10:58:13 +0000 (UTC)
Message-ID: <a0a0ed10c9208c7be10adb483298ceb1d10ef0c8.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: wangjufeng <wangjufeng@huawei.com>, "christophe.varoqui@opensvc.com"
	<christophe.varoqui@opensvc.com>
Date: Tue, 24 Mar 2020 11:58:16 +0100
In-Reply-To: <723608783F175343AAB90DD84928BC3405B3531C@dggeml530-mbs.china.huawei.com>
References: <723608783F175343AAB90DD84928BC3405B3531C@dggeml530-mbs.china.huawei.com>
User-Agent: Evolution 3.34.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02OAwL6B008513
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] multipathd: fix check_path could not resume path
	state
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Wangjufeng,

On Sat, 2020-03-21 at 15:53 +0000, wangjufeng wrote:
> From fb655da18aefccaa09c70036b08c88a03609ec45 Mon Sep 17 00:00:00
> 2001
> From: wangjufeng <wangjufeng@huawei.com>
> Date: Sat, 21 Mar 2020 22:23:10 +0800
> Subject: [PATCH] multipathd: fix check_path could not resume path
> state
> 
> For some unknown reason, after network recovery from disconnection,
> the paths in a multipath are still in fail state. Use gdb attached
> multipathd, the paths seem to be changed by orphan_path function,
> pp->initialized is INIT_OK while pp->mpp is NULL, pp->dmstate is
> PSTATE_UNDEF, pp->fd is -1. And the multipath could not be found in
> gvecs->mpvec while it could be found by dmsetup table command.
> 
> It will lead to that the path state could not be activated by
> check_path even if the iscsi device is already available.
> 
> This patch intend to add the multipath map again to avoid IO failure
> or IO blocked when the above phenomenon occur.
> 
> Signed-off-by: wangjufeng <wangjufeng@huawei.com>
> Reviewed-by: linfeilong <linfeilong@huawei.com>

thank you for your patch. 

I'm not sure if this is the right approach. The purpose of check_path()
is to check existing paths, not for adding new ones, and not for adding
multipath maps.

I'd like to understand your failure scenario better. 

You seem to disconnect all paths of a multipath map, causing the
path devices to be deleted from the system. Indeed, if this happens,
and the last path is removed, multipathd will also remove the multipath
map from mpvec. But then, if the paths are re-added, I'd expect ADD
udev events to occur. multipathd should notice these uevents and re-add 
both the paths and the map.

If this fails in your scenario, something is wrong with uevent
handling. 

 - please indicate exactly what multipath-tools version you've been
using
 - how do you disconnect / reconnect devices? are the lowlevel devices
set offline, blocked / unreachable, or actually removed from the
system?
 - in any case, please provide a log of multipathd taken with at least
verbosity 3 showing what's going on in your system in the failure
scenario. Help us understand your log by indicating when you
disconnected or reconnected storage volumes.

You may also want to run "udevadm monitor" separately, to figure out if
uevents are correctly generated.

Regards
Martin

PS: Your patch has whitespace issues. Next time, please make sure that
you get the indentation right.



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

