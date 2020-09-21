Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 057F9271E15
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 10:38:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-Zt8KNGWNNC2pV_QYaho4kQ-1; Mon, 21 Sep 2020 04:37:57 -0400
X-MC-Unique: Zt8KNGWNNC2pV_QYaho4kQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6B531868423;
	Mon, 21 Sep 2020 08:37:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDF941C922;
	Mon, 21 Sep 2020 08:37:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77E6B8C7D5;
	Mon, 21 Sep 2020 08:37:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08L8ZghB022712 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 04:35:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3EC4E2166BA0; Mon, 21 Sep 2020 08:35:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A1762166B28
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 08:35:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5336800969
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 08:35:39 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-495-5yMgouCuNt2RDIewsUAoOA-1;
	Mon, 21 Sep 2020 04:35:37 -0400
X-MC-Unique: 5yMgouCuNt2RDIewsUAoOA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A720AB523;
	Mon, 21 Sep 2020 08:36:11 +0000 (UTC)
Message-ID: <1cb705785cf5d77b89002135b9411900fb82b630.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 21 Sep 2020 10:35:34 +0200
In-Reply-To: <20200919221422.GW11108@octiron.msp.redhat.com>
References: <20200916153718.582-1-mwilck@suse.com>
	<20200916153718.582-11-mwilck@suse.com>
	<20200919221422.GW11108@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH 10/19] libmultipath: devmapper: refactor
 libdm version determination
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 2020-09-19 at 17:14 -0500, Benjamin Marzinski wrote:
> On Wed, Sep 16, 2020 at 05:37:09PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > As one step towards bundling all possibly racy libdm init calls
> > into a single
> > function, split the code for determining and checking versions of
> > libdm and kernel components. Provide a generic helper
> > libmp_get_version() that makes sure the versions are "lazily"
> > initialized.
> > Note that retrieving the versions requires libdm calls, thus the
> > version initialization calls libdm initialization, which might call
> > version initialization recursively. But that's not an issue, as
> > the initialization is protected by pthread_once().
> 
> This is confusing me. dm_tgt_version will call
> DM_DEVICE_LIST_VERSIONS,
> but it doesn't call libmp_dm_task_create(), so I don't see the
> recursion
> possiblity. 

You are right, I was confused. 
The callstack for "lazy" initialization looks like this:

libmp_dm_task_create
  pthread_once(&dm_initialized, libmp_dm_init);
    libmp_dm_init()
=>    dm_prereq()
        init_versions
          pthread_once(&versions_initialized, _init_versions);
            _init_versions()
              init_dm_library_version()
              init_dm_drv_version()
              init_dm_mpath_version()
                dm_tgt_version
**                dm_task_create
                  libmp_task_run()
                    pthread_mutex_lock(&libmp_dm_lock);
                    dm_task_run()

(If an application called dm_prereq() explicitly, it would enter
the stack at "=>", which would be less of a problem).

I suppose I should add a comment at "**" saying that we must not call
libmp_dm_task_create() there to avoid recursion. I also notice that my
function naming I used is inconsistent; it should be
libmp_dm_task_run() rather than just libmp_task_run().

> That's good because according to the man page:
> 
> "If you specify a routine that directly or indirectly results in a
> recursive call to pthread_once(3) and that specifies the same routine
> argument, the recursive call can result in a deadlock."

Thanks for pointing this out. I had missed that indeed.

I see this paragraph only in some old DECThreads man pages on the web.
There's a slighly different "APPLICATION USAGE" statement under 
https://pubs.opengroup.org/onlinepubs/9699919799/. The pragraph is
missing in https://man7.org/linux/man-pages/man3/pthread_once.3p.html,
which is still based on POSIX.1-2008, 2013 edition - that's why I
missed it.

Anyway, it makes sense, because pthread_once() guarantees that the init
routine has _finished_ when it returns, which can't work with recursive
calls.

Anyway, I'll send a v2.

Regards
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

