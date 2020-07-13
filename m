Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B010321D39A
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 12:13:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594635216;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mfPDpWZJ1ri+5PaHlnOZUqT/2ivssh/NsJ//ccKpIwE=;
	b=QJy7hTa/iUj+r7jTVQtRqzWqj+tWDSQ0mOaICAFcKVI5iL1k4kf5WiV2u8XznnXP3iIpUc
	rg2PNKzF2bPTq1AVig4vIIIadXcKi4pBIAYRUv1Ptfwv1xMMBvqpZS0L7JIcLYPyKgE9fx
	Lb0PEJUMBAYfYzAkBx9svioROaWl9LA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-6IDeH9xBN1C8JxiJeG52NA-1; Mon, 13 Jul 2020 06:13:34 -0400
X-MC-Unique: 6IDeH9xBN1C8JxiJeG52NA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70128100AA27;
	Mon, 13 Jul 2020 10:13:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B90BC0D8B;
	Mon, 13 Jul 2020 10:13:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D33481809554;
	Mon, 13 Jul 2020 10:13:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DADKOo009810 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 06:13:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 839FD7620F; Mon, 13 Jul 2020 10:13:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [10.40.195.156] (unknown [10.40.195.156])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCF787620D;
	Mon, 13 Jul 2020 10:13:15 +0000 (UTC)
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>
References: <6eb10725-456f-de68-e927-1f5a9771c16c@huawei.com>
	<86d8307c-1747-2254-4f87-fac36f0d51ca@redhat.com>
	<0d26c9f6-4379-f201-a9a5-839bddef3f25@huawei.com>
	<92db2c49d0ddbbc385c6a14ef3d99a54457b908e.camel@suse.com>
	<b482dfdb-a40b-e523-1dcc-d37ddc4fc399@redhat.com>
	<fa7df2b4c81f9420f12c1e8a5d74b8c42cf45543.camel@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: Red Hat
Message-ID: <f1284ab7-8897-805c-d62e-f6cadb6158ca@redhat.com>
Date: Mon, 13 Jul 2020 12:13:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <fa7df2b4c81f9420f12c1e8a5d74b8c42cf45543.camel@suse.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Dne 13. 07. 20 v 12:08 Martin Wilck napsal(a):
> Hi Zdenek,
> 
> On Mon, 2020-07-13 at 11:56 +0200, Zdenek Kabelac wrote:
>> Dne 13. 07. 20 v 11:21 Martin Wilck napsal(a):
>>> Hi Lixiaokeng,
>>>
>>>
>>> @Zdenek, do we have to protect every libdm call, or is it
>>> sufficient
>>> to protect only dm_task_run(), as lixiaokeng suggested?
>>>
>>
>> Hi
>>
>> It's actually hard to answer it in a simple way.
>> Several properties are held in library static variables. So
>> converting libdm
>> into a fully threaded 'version' would basically require to duplicate
>> all API
>> functions with extended 'context' structure passed in - where all
>> buffers can
>> be maintained properly (and it's getting more complicated with signal
>> handling
>> and debug logging).
> 
> Sure. I don't think this is where we're going for. But we need to
> figure out how to handle this properly in libmultipath.
> I take it that we must really protect *every* libdm call in
> libmultipath and multipathd if we want to do it right.
> 
>> ATM it doesn't look like there is a big need for threaded support of
>> DM usage
>> as majority of tools spends most of their time outside thus
>> 'serialization'
>> of lvm2 or dmeventd on libdm access look doesn't look like a big
>> issue
>> (let's say there are far bigger fishes to hunt).
> 
> Agreed.
> 
>> As for the issue of keeping control_fd open - there should be a
>> synchronized
>> call of dm_hold_control_dev(0/1) -  see the codebase of  dmeventd.c
>> in lvm2
>> code base - how we solve the control_fd handling.
> 
> Ben has already added support for dm_hold_control_dev() in libmultipath
> (e24d8b1 ("libmutipath: don't close fd on dm_lib_release")). But this
> doesn't protect us from calling _open_control() simultaneously in
> separate code paths, as Lixiaokeng has pointed out.
> 
> I don't see how it would, as dm_hold_control_dev() also just changes
> a static variable.


Here I'm not familiar with  multipath codebase (more a question for Ben 
likely), but is 'dm_hold...()' being used in non-threaded way - i.e. in 
dmeventd these functions are called  before/after threads are finished - so 
there would be no way 2 threads may call this function in parallel ?

Zdenek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

