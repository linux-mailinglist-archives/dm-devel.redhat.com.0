Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9014521D394
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 12:09:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-lrgNRgjIOYKpgNDSdEZYsg-1; Mon, 13 Jul 2020 06:09:16 -0400
X-MC-Unique: lrgNRgjIOYKpgNDSdEZYsg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C431E800400;
	Mon, 13 Jul 2020 10:09:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E11BC0D8B;
	Mon, 13 Jul 2020 10:09:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B86F4180954D;
	Mon, 13 Jul 2020 10:09:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DA8w2U009484 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 06:08:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F2872201828C; Mon, 13 Jul 2020 10:08:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA2952018283
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 10:08:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 244E8800399
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 10:08:55 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-265-OpX9p_cmMrqUV-hRSeLsfA-1;
	Mon, 13 Jul 2020 06:08:50 -0400
X-MC-Unique: OpX9p_cmMrqUV-hRSeLsfA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1D182B143;
	Mon, 13 Jul 2020 10:08:51 +0000 (UTC)
Message-ID: <fa7df2b4c81f9420f12c1e8a5d74b8c42cf45543.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zdenek Kabelac <zkabelac@redhat.com>, lixiaokeng <lixiaokeng@huawei.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 13 Jul 2020 12:08:48 +0200
In-Reply-To: <b482dfdb-a40b-e523-1dcc-d37ddc4fc399@redhat.com>
References: <6eb10725-456f-de68-e927-1f5a9771c16c@huawei.com>
	<86d8307c-1747-2254-4f87-fac36f0d51ca@redhat.com>
	<0d26c9f6-4379-f201-a9a5-839bddef3f25@huawei.com>
	<92db2c49d0ddbbc385c6a14ef3d99a54457b908e.camel@suse.com>
	<b482dfdb-a40b-e523-1dcc-d37ddc4fc399@redhat.com>
User-Agent: Evolution 3.36.3
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Zdenek,

On Mon, 2020-07-13 at 11:56 +0200, Zdenek Kabelac wrote:
> Dne 13. 07. 20 v 11:21 Martin Wilck napsal(a):
> > Hi Lixiaokeng,
> > 
> > 
> > @Zdenek, do we have to protect every libdm call, or is it
> > sufficient
> > to protect only dm_task_run(), as lixiaokeng suggested?
> > 
> 
> Hi
> 
> It's actually hard to answer it in a simple way.
> Several properties are held in library static variables. So
> converting libdm
> into a fully threaded 'version' would basically require to duplicate
> all API 
> functions with extended 'context' structure passed in - where all
> buffers can 
> be maintained properly (and it's getting more complicated with signal
> handling 
> and debug logging).

Sure. I don't think this is where we're going for. But we need to
figure out how to handle this properly in libmultipath.
I take it that we must really protect *every* libdm call in
libmultipath and multipathd if we want to do it right.

> ATM it doesn't look like there is a big need for threaded support of
> DM usage
> as majority of tools spends most of their time outside thus
> 'serialization'
> of lvm2 or dmeventd on libdm access look doesn't look like a big
> issue
> (let's say there are far bigger fishes to hunt).

Agreed.

> As for the issue of keeping control_fd open - there should be a
> synchronized 
> call of dm_hold_control_dev(0/1) -  see the codebase of  dmeventd.c
> in lvm2 
> code base - how we solve the control_fd handling.

Ben has already added support for dm_hold_control_dev() in libmultipath
(e24d8b1 ("libmutipath: don't close fd on dm_lib_release")). But this
doesn't protect us from calling _open_control() simultaneously in
separate code paths, as Lixiaokeng has pointed out.

I don't see how it would, as dm_hold_control_dev() also just changes
a static variable.

Thanks for your quick answer,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

