Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9224430EF5B
	for <lists+dm-devel@lfdr.de>; Thu,  4 Feb 2021 10:15:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612430109;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T5BSntafLWA2o5mmbumiZ6q0ovodSV1NZsP4RA87KHg=;
	b=b1MWW5GLA06CDFhxqDr3pZIRZGHE5+NRacPksJfEIXo6dQT7qcWRLyAsOHhvW+nBZ6dBsR
	ziSEdlnpJ/AGZ+LblWfcznVRnHFLCFOfVnk1snT5z1Kl4I6mjVlJaKZ8SHsCm/Ea8kWYVm
	mjimpdhDk42SYxQcdBMWVUR/qiBQtuc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-KCj2iq1vOsaoEU1b_jMK_Q-1; Thu, 04 Feb 2021 04:15:07 -0500
X-MC-Unique: KCj2iq1vOsaoEU1b_jMK_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B421B107ACE8;
	Thu,  4 Feb 2021 09:15:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E9CB60C66;
	Thu,  4 Feb 2021 09:15:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C02418095CD;
	Thu,  4 Feb 2021 09:15:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1142bZ6x024991 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 21:37:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC0F15B698; Thu,  4 Feb 2021 02:37:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from treble (ovpn-113-81.rdu2.redhat.com [10.10.113.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 383D85B695;
	Thu,  4 Feb 2021 02:37:21 +0000 (UTC)
Date: Wed, 3 Feb 2021 20:37:19 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Ivan Babrou <ivan@cloudflare.com>
Message-ID: <20210204023719.sbwh7o7un7j2zgkd@treble>
References: <CABWYdi3HjduhY-nQXzy2ezGbiMB1Vk9cnhW2pMypUa+P1OjtzQ@mail.gmail.com>
	<CABWYdi27baYc3ShHcZExmmXVmxOQXo9sGO+iFhfZLq78k8iaAg@mail.gmail.com>
	<YBrTaVVfWu2R0Hgw@hirez.programming.kicks-ass.net>
	<CABWYdi2ephz57BA8bns3reMGjvs5m0hYp82+jBLZ6KD3Ba6zdQ@mail.gmail.com>
	<20210203190518.nlwghesq75enas6n@treble>
	<CABWYdi1ya41Ju9SsHMtRQaFQ=s8N23D3ADn6OV6iBwWM6H8=Zw@mail.gmail.com>
	<20210203232735.nw73kugja56jp4ls@treble>
	<CABWYdi1zd51Jb35taWeGC-dR9SChq-4ixvyKms3KOKgV0idfPg@mail.gmail.com>
	<20210204001700.ry6dpqvavcswyvy7@treble>
	<CABWYdi0p91Y+TDUu38eey-p2GtxL6f=VHicTxS629VCMmrNLpQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABWYdi0p91Y+TDUu38eey-p2GtxL6f=VHicTxS629VCMmrNLpQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 04 Feb 2021 04:14:38 -0500
Cc: Song Liu <songliubraving@fb.com>, Mike Snitzer <snitzer@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Alexei Starovoitov <ast@kernel.org>, linux-mm@kvack.org,
	dm-devel@redhat.com, Alexander Potapenko <glider@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
	Miroslav Benes <mbenes@suse.cz>, Jiri Slaby <jirislaby@kernel.org>,
	Alasdair Kergon <agk@redhat.com>, Daniel Borkmann <daniel@iogearbox.net>,
	kernel-team <kernel-team@cloudflare.com>,
	Hailong liu <liu.hailong6@zte.com.cn>, x86@kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	kasan-dev@googlegroups.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
	Ingo Molnar <mingo@redhat.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
	Andrii Nakryiko <andriin@fb.com>, Robert Richter <rric@kernel.org>,
	"Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
	Borislav Petkov <bp@alien8.de>, Yonghong Song <yhs@fb.com>,
	KP Singh <kpsingh@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org,
	Dmitry Vyukov <dvyukov@google.com>, Julien Thierry <jthierry@redhat.com>,
	Linux Kernel Network Developers <netdev@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>, Martin KaFai Lau <kafai@fb.com>
Subject: Re: [dm-devel] BUG: KASAN: stack-out-of-bounds in
 unwind_next_frame+0x1df5/0x2650
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 03, 2021 at 04:52:42PM -0800, Ivan Babrou wrote:
> We also have the following stack that doesn't touch any crypto:
> 
> * https://gist.github.com/bobrik/40e2559add2f0b26ae39da30dc451f1e

Can you also run this through decode_stacktrace.sh?

Both are useful (until I submit a fix for decode_stacktrace.sh).

> I cannot reproduce this one, and it took 2 days of uptime for it to
> happen. Is there anything I can do to help diagnose it?

Can you run with the same unwind_debug patch+cmdline when you try to
recreate this one?  In the meantime I'll look at the available data.

-- 
Josh

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

