Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7010331DC3F
	for <lists+dm-devel@lfdr.de>; Wed, 17 Feb 2021 16:35:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613576103;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QCCQc3SmJ9YpH7HWQvhBLcz0Ee1xDZzkRVf4zE0OxFU=;
	b=P4l/G2ReolorVYK/GOmMtz/C8rAiiL4L7W7py7r7a58UDE0TGrErnUfyMQBvbGi8kJa5Xk
	2SSVtTebww6BgDuWokOQZobkhzWR4EbhcvMIfXSzryfyf9xw0HOmLaQK2erqjjtumoGJ07
	LBxAISz9IPVruSDJT+SbraoYnXmYUoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-0NAU0XkWOO-1vKI9STo4zA-1; Wed, 17 Feb 2021 10:34:47 -0500
X-MC-Unique: 0NAU0XkWOO-1vKI9STo4zA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27935835E22;
	Wed, 17 Feb 2021 15:34:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 004075D9C2;
	Wed, 17 Feb 2021 15:34:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A21E918095CB;
	Wed, 17 Feb 2021 15:34:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 114KMRx5017902 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Feb 2021 15:22:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0B32A722C6; Thu,  4 Feb 2021 20:22:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from treble (ovpn-114-156.rdu2.redhat.com [10.10.114.156])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A7DB722D9;
	Thu,  4 Feb 2021 20:22:14 +0000 (UTC)
Date: Thu, 4 Feb 2021 14:22:10 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Ivan Babrou <ivan@cloudflare.com>
Message-ID: <20210204202210.4awpfn2ckdv7h5cf@treble>
References: <CABWYdi3HjduhY-nQXzy2ezGbiMB1Vk9cnhW2pMypUa+P1OjtzQ@mail.gmail.com>
	<CABWYdi27baYc3ShHcZExmmXVmxOQXo9sGO+iFhfZLq78k8iaAg@mail.gmail.com>
	<YBrTaVVfWu2R0Hgw@hirez.programming.kicks-ass.net>
	<CABWYdi2ephz57BA8bns3reMGjvs5m0hYp82+jBLZ6KD3Ba6zdQ@mail.gmail.com>
	<20210203190518.nlwghesq75enas6n@treble>
	<CABWYdi1ya41Ju9SsHMtRQaFQ=s8N23D3ADn6OV6iBwWM6H8=Zw@mail.gmail.com>
	<20210203232735.nw73kugja56jp4ls@treble>
	<CABWYdi1zd51Jb35taWeGC-dR9SChq-4ixvyKms3KOKgV0idfPg@mail.gmail.com>
	<20210204001700.ry6dpqvavcswyvy7@treble>
	<CABWYdi2GsFW9ExXAQ55tvr+K86eY15T1XFoZDDBro9hJK5Gpqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABWYdi2GsFW9ExXAQ55tvr+K86eY15T1XFoZDDBro9hJK5Gpqg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 17 Feb 2021 10:31:26 -0500
Cc: Song Liu <songliubraving@fb.com>, Mike Snitzer <snitzer@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
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
	kasan-dev@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
	Andrey Ryabinin <aryabinin@virtuozzo.com>,
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
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 04, 2021 at 11:51:44AM -0800, Ivan Babrou wrote:
> >  .macro FUNC_SAVE
> >          #the number of pushes must equal STACK_OFFSET
> > +       push    %rbp
> > +       mov     %rsp, %rbp
> >          push    %r12
> >          push    %r13
> >          push    %r14
> > @@ -271,12 +273,14 @@ VARIABLE_OFFSET = 16*8
> >  .endm
> >
> >  .macro FUNC_RESTORE
> > +        add     $VARIABLE_OFFSET, %rsp
> >          mov     %r14, %rsp
> >
> >          pop     %r15
> >          pop     %r14
> >          pop     %r13
> >          pop     %r12
> > +       pop     %rbp
> >  .endm
> >
> >  # Encryption of a single block
> >
> 
> This patch seems to fix the following warning:
> 
> [  147.995699][    C0] WARNING: stack going in the wrong direction? at
> glue_xts_req_128bit+0x21f/0x6f0 [glue_helper]
> 
> Or at least I cannot see it anymore when combined with your other
> patch, not sure if it did the trick by itself.
> 
> This sounds like a good reason to send them both.

Ok, that's what I expected.

The other patch fixed the unwinder failure mode to be the above
(harmless) unwinder warning, instead of a disruptive KASAN failure.

This patch fixes the specific underlying crypto unwinding metadata
issue.

I'll definitely be sending both fixes.  The improved failure mode patch
will come first because it's more urgent and lower risk.

-- 
Josh

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

