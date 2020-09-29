Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE0A27C0D7
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 11:18:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-G0XYtTbYNweLA4rrJrmINw-1; Tue, 29 Sep 2020 05:18:40 -0400
X-MC-Unique: G0XYtTbYNweLA4rrJrmINw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D16210BBED3;
	Tue, 29 Sep 2020 09:18:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5466628545;
	Tue, 29 Sep 2020 09:18:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 543B044A57;
	Tue, 29 Sep 2020 09:18:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08T9IN6M013762 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 29 Sep 2020 05:18:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 79845110C568; Tue, 29 Sep 2020 09:18:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 750EB110C57C
	for <dm-devel@redhat.com>; Tue, 29 Sep 2020 09:18:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21848805C19
	for <dm-devel@redhat.com>; Tue, 29 Sep 2020 09:18:21 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-381-U9goPIrSOTi_HQ3rcfIKxg-1;
	Tue, 29 Sep 2020 05:18:16 -0400
X-MC-Unique: U9goPIrSOTi_HQ3rcfIKxg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E94CEAC5B;
	Tue, 29 Sep 2020 09:18:14 +0000 (UTC)
Message-ID: <f7e7f62ed6b79c08b2f494bcd45ba09e265de55b.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 29 Sep 2020 11:18:13 +0200
In-Reply-To: <20200928201523.GO3384@octiron.msp.redhat.com>
References: <20200924134054.14632-1-mwilck@suse.com>
	<20200924134054.14632-19-mwilck@suse.com>
	<20200928201523.GO3384@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 18/23] libmultipath: fix log_thread startup
	and teardown
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

On Mon, 2020-09-28 at 15:15 -0500, Benjamin Marzinski wrote:
> On Thu, Sep 24, 2020 at 03:40:49PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > This fixes several issues with the log_thread. First, the running
> > flag logq_running should be set by the thread itself, not by
> > log_thread_start()/_stop(). Second, the thread was both cancelled
> > and
> > terminated via a flag (again, logq_running). It's sufficient,
> > and better, to just cancel it and use logq_running as indication
> > for
> > successful termination. Third, the locking wasn't cancel-safe in
> > some
> > places. Forth, log_thread_start() and log_thread_stop() didn't wait
> > for
> > startup/teardown properly. Fifth, using (pthread_t)0 is wrong
> > (pthread_t is
> > opaque; there's no guarantee that 0 is not a valid pthread_t
> > value). Finally,
> > pthread_cancel() was called under logq_lock, which doesn't make
> > sense to
> > me at all.
> > 
> > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > ---
> >  
> >  	pthread_mutex_lock(&logev_lock);
> > -	logq_running = 0;
> > -	pthread_cond_signal(&logev_cond);
> > -	pthread_mutex_unlock(&logev_lock);
> > +	pthread_cleanup_push(cleanup_mutex, &logev_lock);
> > +	running = logq_running;
> > +	if (running) {
> > +		pthread_cancel(log_thr);
> > +		pthread_cond_signal(&logev_cond);
> > +	}
> > +	while (logq_running)
> > +		pthread_cond_wait(&logev_cond, &logev_lock);
> 
> If we're already going to join the thread, why do we have to wait for
> the cleanup handler first? Won't the join do the waiting we need?

Yes, I guess it would. I implemented it in a way analogous the startup
sequence, but it's really not necessary for shutdown. Thanks for
pointing it out.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

