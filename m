Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B9744505F
	for <lists+dm-devel@lfdr.de>; Thu,  4 Nov 2021 09:31:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-fHH0Pe-JMjKYJhlb5mG4aQ-1; Thu, 04 Nov 2021 04:31:30 -0400
X-MC-Unique: fHH0Pe-JMjKYJhlb5mG4aQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 952DD1129581;
	Thu,  4 Nov 2021 08:31:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17231A6C44;
	Thu,  4 Nov 2021 08:31:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6ED914A703;
	Thu,  4 Nov 2021 08:31:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A48V6UI014719 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Nov 2021 04:31:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 44B572026D5D; Thu,  4 Nov 2021 08:31:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 400142026D46
	for <dm-devel@redhat.com>; Thu,  4 Nov 2021 08:31:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7151D8041AA
	for <dm-devel@redhat.com>; Thu,  4 Nov 2021 08:31:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-226-Xkvgl836N8qRNhiQcRKulg-1; Thu, 04 Nov 2021 04:30:59 -0400
X-MC-Unique: Xkvgl836N8qRNhiQcRKulg-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1miY92-008IOw-BM; Thu, 04 Nov 2021 08:30:48 +0000
Date: Thu, 4 Nov 2021 01:30:48 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <YYOaOBKgFQYzT/s/@infradead.org>
References: <YXFPfEGjoUaajjL4@infradead.org>
	<e89a2b17-3f03-a43e-e0b9-5d2693c3b089@oracle.com>
	<YXJN4s1HC/Y+KKg1@infradead.org>
	<2102a2e6-c543-2557-28a2-8b0bdc470855@oracle.com>
	<YXj2lwrxRxHdr4hb@infradead.org>
	<20211028002451.GB2237511@magnolia>
	<YYDYUCCiEPXhZEw0@infradead.org>
	<CAPcyv4j8snuGpy=z6BAXogQkP5HmTbqzd6e22qyERoNBvFKROw@mail.gmail.com>
	<YYK/tGfpG0CnVIO4@infradead.org>
	<CAPcyv4it2_PVaM8z216AXm6+h93frg79WM-ziS9To59UtEQJTA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPcyv4it2_PVaM8z216AXm6+h93frg79WM-ziS9To59UtEQJTA@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jane Chu <jane.chu@oracle.com>,
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"dave.jiang@intel.com" <dave.jiang@intel.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	"david@fromorbit.com" <david@fromorbit.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"willy@infradead.org" <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"vgoyal@redhat.com" <vgoyal@redhat.com>,
	"vishal.l.verma@intel.com" <vishal.l.verma@intel.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"ira.weiny@intel.com" <ira.weiny@intel.com>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/6] dax poison recovery with
 RWF_RECOVERY_DATA flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 03, 2021 at 01:33:58PM -0700, Dan Williams wrote:
> Is the exception table requirement not already fulfilled by:
> 
> sigaction(SIGBUS, &act, 0);
> ...
> if (sigsetjmp(sj_env, 1)) {
> ...
> 
> ...but yes, that's awkward when all you want is an error return from a
> copy operation.

Yeah.  The nice thing about the kernel uaccess / _nofault helpers is
that they allow normal error handling flows.

> For _nofault I'll note that on the kernel side Linus was explicit
> about not mixing fault handling and memory error exception handling in
> the same accessor. That's why copy_mc_to_kernel() and
> copy_{to,from}_kernel_nofault() are distinct.

I've always wondered why we need all this mess.  But if the head
penguin wants it..

> I only say that to probe
> deeper about what a "copy_mc()" looks like in userspace? Perhaps an
> interface to suppress SIGBUS generation and register a ring buffer
> that gets filled with error-event records encountered over a given
> MMAP I/O code sequence?

Well, the equivalent to the kernel uaccess model would be to register
a SIGBUS handler that uses an exception table like the kernel, and then
if you use the right helpers to load/store they can return errors.

The other option would be something more like the Windows Structured
Exception Handling:

https://docs.microsoft.com/en-us/cpp/cpp/structured-exception-handling-c-cpp?view=msvc-160


> > I think you misunderstood me.  I don't think pmem needs to be
> > decoupled from the read/write path.  But I'm very skeptical of adding
> > a new flag to the common read/write path for the special workaround
> > that a plain old write will not actually clear errors unlike every
> > other store interfac.
> 
> Ah, ok, yes, I agree with you there that needing to redirect writes to
> a platform firmware call to clear errors, and notify the device that
> its error-list has changed is exceedingly awkward.

Yes.  And that is the big difference to every other modern storage
device.  SSDs always write out of place and will just not reuse bad
blocks, and all drivers built in the last 25-30 years will also do
internal bad block remapping.

> That said, even if
> the device-side error-list auto-updated on write (like the promise of
> MOVDIR64B) there's still the question about when to do management on
> the software error lists in the driver and/or filesytem. I.e. given
> that XFS at least wants to be aware of the error lists for block
> allocation and "list errors" type features. More below...

Well, the whole problem is that we should not have to manage this at
all, and this is where I blame Intel.  There is no good reason to not
slightly overprovision the nvdimms and just do internal bad page
remapping like every other modern storage device.

> Hasn't this been a perennial topic at LSF/MM, i.e. how to get an
> interface for the filesystem to request "try harder" to return data?

Trying harder to _get_ data or to _store_ data?  All the discussion
here seems to be able about actually writing data.

> If the device has a recovery slow-path, or error tracking granularity
> is smaller than the I/O size, then RWF_RECOVER_DATA gives the
> device/driver leeway to do better than the typical fast path. For
> writes though, I can only come up with the use case of this being a
> signal to the driver to take the opportunity to do error-list
> management relative to the incoming write data.

Well, while devices have data recovery slow path they tend to use those
automatically.  What I'm actually seeing in practice is flags in the
storage interfaces to skip this slow path recovery because the higher
level software would prefer to instead recover e.g. from remote copies.

> However, if signaling that "now is the time to update error-lists" is
> the requirement, I imagine the @kaddr returned from
> dax_direct_access() could be made to point to an unmapped address
> representing the poisoned page. Then, arrange for a pmem-driver fault
> handler to emulate the copy operation and do the slow path updates
> that would otherwise have been gated by RWF_RECOVER_DATA.

That does sound like a much better interface than most of what we've
discussed so far. 

> Although, I'm not excited about teaching every PMEM arch's fault
> handler about this new source of kernel faults. Other ideas?
> RWF_RECOVER_DATA still seems the most viable / cleanest option, but
> I'm willing to do what it takes to move this error management
> capability forward.

So far out of the low instrusiveness options Janes' previous series
to automatically retry after calling a clear_poison operation seems
like the best idea so far.  We just need to also think about what
we want to do for direct users of ->direct_access that do not use
the mcsafe iov_iter helpers.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

