Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3C121D3BE
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 12:28:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-2T2pi8HtMM-7n8rBi0dtiw-1; Mon, 13 Jul 2020 06:28:27 -0400
X-MC-Unique: 2T2pi8HtMM-7n8rBi0dtiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBD551083E85;
	Mon, 13 Jul 2020 10:28:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E2A05C6C0;
	Mon, 13 Jul 2020 10:28:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2730C93F89;
	Mon, 13 Jul 2020 10:28:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DARsAL011149 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 06:27:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 75ECD10CD936; Mon, 13 Jul 2020 10:27:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 124C310CD918
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 10:27:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1183C83B861
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 10:27:52 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-39-eItwPr0aMsyS4mryTVZUfA-1;
	Mon, 13 Jul 2020 06:27:45 -0400
X-MC-Unique: eItwPr0aMsyS4mryTVZUfA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1707EAD1A;
	Mon, 13 Jul 2020 10:27:46 +0000 (UTC)
Message-ID: <b572a8bbf63b1bde9a2ec53cb909468cfc61cbaf.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zdenek Kabelac <zkabelac@redhat.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, lixiaokeng <lixiaokeng@huawei.com>
Date: Mon, 13 Jul 2020 12:27:43 +0200
In-Reply-To: <f1284ab7-8897-805c-d62e-f6cadb6158ca@redhat.com>
References: <6eb10725-456f-de68-e927-1f5a9771c16c@huawei.com>
	<86d8307c-1747-2254-4f87-fac36f0d51ca@redhat.com>
	<0d26c9f6-4379-f201-a9a5-839bddef3f25@huawei.com>
	<92db2c49d0ddbbc385c6a14ef3d99a54457b908e.camel@suse.com>
	<b482dfdb-a40b-e523-1dcc-d37ddc4fc399@redhat.com>
	<fa7df2b4c81f9420f12c1e8a5d74b8c42cf45543.camel@suse.com>
	<f1284ab7-8897-805c-d62e-f6cadb6158ca@redhat.com>
User-Agent: Evolution 3.36.3
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-13 at 12:13 +0200, Zdenek Kabelac wrote:
> Dne 13. 07. 20 v 12:08 Martin Wilck napsal(a):
> > 
> > Ben has already added support for dm_hold_control_dev() in
> > libmultipath
> > (e24d8b1 ("libmutipath: don't close fd on dm_lib_release")). But
> > this
> > doesn't protect us from calling _open_control() simultaneously in
> > separate code paths, as Lixiaokeng has pointed out.
> > 
> > I don't see how it would, as dm_hold_control_dev() also just
> > changes
> > a static variable.
> 
> Here I'm not familiar with  multipath codebase (more a question for
> Ben 
> likely), but is 'dm_hold...()' being used in non-threaded way - i.e.
> in 
> dmeventd these functions are called  before/after threads are
> finished - so 
> there would be no way 2 threads may call this function in parallel ?

Yes, it's called via pthread_once().

@Lixiaokeng, that would suggest a simpler solution to your fd leak
problem than what I posted before. You'd just need to apply Ben's patch
"libmutipath: don't close fd on dm_lib_release" submitted March
24th.

Contrary to what I said before, this patch is NOT merged yet. The commit id e24d8b1 was from my "upstream-queue" branch only 
(https://github.com/openSUSE/multipath-tools/tree/upstream-queue)

Could you try with that patch (and without mine sent previously)?

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

