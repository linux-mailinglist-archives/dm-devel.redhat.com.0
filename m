Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4A456399AD8
	for <lists+dm-devel@lfdr.de>; Thu,  3 Jun 2021 08:34:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-LRuFXUVdMTCmr-3mDB1QVw-1; Thu, 03 Jun 2021 02:33:25 -0400
X-MC-Unique: LRuFXUVdMTCmr-3mDB1QVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CFFF803635;
	Thu,  3 Jun 2021 06:33:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E599550F89;
	Thu,  3 Jun 2021 06:33:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F67C44A5D;
	Thu,  3 Jun 2021 06:33:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 152EPRo5000320 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Jun 2021 10:25:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BEDA12162382; Wed,  2 Jun 2021 14:25:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAF9F2162383
	for <dm-devel@redhat.com>; Wed,  2 Jun 2021 14:25:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF2F210334A4
	for <dm-devel@redhat.com>; Wed,  2 Jun 2021 14:25:23 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-586-QRFMJvVEPdW-TCFVqSAZtQ-1; Wed, 02 Jun 2021 10:25:19 -0400
X-MC-Unique: QRFMJvVEPdW-TCFVqSAZtQ-1
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
	helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1loRmn-00BCUs-DM; Wed, 02 Jun 2021 14:24:00 +0000
Received: from hirez.programming.kicks-ass.net
	(hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D1C23300269;
	Wed,  2 Jun 2021 16:23:56 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id B6EF620223DA8; Wed,  2 Jun 2021 16:23:56 +0200 (CEST)
Date: Wed, 2 Jun 2021 16:23:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Message-ID: <YLeUfNEqKg27VwAB@hirez.programming.kicks-ass.net>
References: <20210602131225.336600299@infradead.org>
	<20210602133040.398289363@infradead.org>
	<1524365960.5868.1622643316351.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
In-Reply-To: <1524365960.5868.1622643316351.JavaMail.zimbra@efficios.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 03 Jun 2021 02:32:49 -0400
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Pavel Machek <pavel@ucw.cz>, Mike Snitzer <snitzer@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kgdb-bugreport@lists.sourceforge.net,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>, Ben Segall <bsegall@google.com>,
	linux-mm <linux-mm@kvack.org>, dm-devel@redhat.com,
	Paolo Bonzini <pbonzini@redhat.com>, Zefan Li <lizefan.x@bytedance.com>,
	"H. Peter Anvin" <hpa@zytor.com>, "Joel Fernandes,
	Google" <joel@joelfernandes.org>,
	netdev <netdev@vger.kernel.org>, Jiri Olsa <jolsa@redhat.com>,
	Alasdair Kergon <agk@redhat.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	KVM list <kvm@vger.kernel.org>, Will Deacon <will@kernel.org>,
	cgroups <cgroups@vger.kernel.org>, x86 <x86@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
	Jakub Kicinski <kuba@kernel.org>, paulmck <paulmck@kernel.org>,
	linux-pm@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
	Jason Wessel <jason.wessel@windriver.com>,
	Josh Triplett <josh@joshtriplett.org>,
	rostedt <rostedt@goodmis.org>, linux-block@vger.kernel.org,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Waiman Long <longman@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, acme <acme@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-perf-users@vger.kernel.org,
	Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
	John Stultz <john.stultz@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	rcu <rcu@vger.kernel.org>, bristot <bristot@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [dm-devel] [PATCH 3/6] sched, perf,
	kvm: Fix preemption condition
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 02, 2021 at 10:15:16AM -0400, Mathieu Desnoyers wrote:
> ----- On Jun 2, 2021, at 9:12 AM, Peter Zijlstra peterz@infradead.org wrote:
> [...]
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -8568,13 +8568,12 @@ static void perf_event_switch(struct tas
> > 		},
> > 	};
> > 
> > -	if (!sched_in && task->state == TASK_RUNNING)
> > +	if (!sched_in && current->on_rq) {
> > 		switch_event.event_id.header.misc |=
> > 				PERF_RECORD_MISC_SWITCH_OUT_PREEMPT;
> > +	}
> > 
> > -	perf_iterate_sb(perf_event_switch_output,
> > -		       &switch_event,
> > -		       NULL);
> > +	perf_iterate_sb(perf_event_switch_output, &switch_event, NULL);
> > }
> 
> There is a lot of code cleanup going on here which does not seem to belong
> to a "Fix" patch.

Maybe, but I so hate whitespace only patches :-/

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

