Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8512616B344
	for <lists+dm-devel@lfdr.de>; Mon, 24 Feb 2020 22:54:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582581249;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=++KIO04djFvVKsgkRyS1RtDKgl93PJDgkXf54fbRnqU=;
	b=L/wmYlWA+OenhP1GdIzxzXWRdAGs7kA8Dnyog30azAcwDTJuoYfYtUSFxod4qTMjjsbN6P
	PbObEzjnGz8ccI72b+0z2mXsb3ozOVvgyBYb3y7VPLrCfVv9wh+aELMTmWkwAM5cEoCwy1
	b6xbE7YyTPPS17FUXKTsswxj6veHWXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-SI3uF9-WPr2dW5gi7Jy6gQ-1; Mon, 24 Feb 2020 16:54:05 -0500
X-MC-Unique: SI3uF9-WPr2dW5gi7Jy6gQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65FE6107ACC9;
	Mon, 24 Feb 2020 21:53:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55FB78B774;
	Mon, 24 Feb 2020 21:53:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB210860C9;
	Mon, 24 Feb 2020 21:53:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OLrfEU020169 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 16:53:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B46541CB; Mon, 24 Feb 2020 21:53:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from segfault.boston.devel.redhat.com
	(segfault.boston.devel.redhat.com [10.19.60.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A58CB8B77D;
	Mon, 24 Feb 2020 21:53:38 +0000 (UTC)
From: Jeff Moyer <jmoyer@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
References: <20200218214841.10076-1-vgoyal@redhat.com>
	<20200218214841.10076-3-vgoyal@redhat.com>
	<x49lfoxj622.fsf@segfault.boston.devel.redhat.com>
	<20200220215707.GC10816@redhat.com>
	<x498skv3i5r.fsf@segfault.boston.devel.redhat.com>
	<20200221201759.GF25974@redhat.com>
	<20200223230330.GE10737@dread.disaster.area>
	<CAPcyv4ghusuMsAq8gSLJKh1fiKjwa8R_-ojVgjsttoPRqBd_Sg@mail.gmail.com>
	<x49blpop00m.fsf@segfault.boston.devel.redhat.com>
	<CAPcyv4gCA_oR8_8+zhAhMnqOga9GcpMX97S+x8_UD6zLEQ0Cew@mail.gmail.com>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date: Mon, 24 Feb 2020 16:53:37 -0500
In-Reply-To: <CAPcyv4gCA_oR8_8+zhAhMnqOga9GcpMX97S+x8_UD6zLEQ0Cew@mail.gmail.com>
	(Dan Williams's message of "Mon, 24 Feb 2020 12:48:35 -0800")
Message-ID: <x49sgizodni.fsf@segfault.boston.devel.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
	Dave Chinner <david@fromorbit.com>, Christoph Hellwig <hch@infradead.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [dm-devel] [PATCH v5 2/8] drivers/pmem: Allow
	pmem_clear_poison() to accept arbitrary offset and len
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

Dan Williams <dan.j.williams@intel.com> writes:

>> Let's just focus on reporting errors when we know we have them.
>
> That's the problem in my eyes. If software needs to contend with
> latent error reporting then it should always contend otherwise
> software has multiple error models to wrangle.

The only way for an application to know that the data has been written
successfully would be to issue a read after every write.  That's not a
performance hit most applications are willing to take.  And, of course,
the media can still go bad at a later time, so it only guarantees the
data is accessible immediately after having been written.

What I'm suggesting is that we should not complete a write successfully
if we know that the data will not be retrievable.  I wouldn't call this
adding an extra error model to contend with.  Applications should
already be checking for errors on write.

Does that make sense?  Are we talking past each other?

> Setting that aside we can start with just treating zeroing the same as
> the copy_from_iter() case and fail the I/O at the dax_direct_access()
> step.

OK.

> I'd rather have a separate op that filesystems can use to clear errors
> at block allocation time that can be enforced to have the correct
> alignment.

So would file systems always call that routine instead of zeroing, or
would they first check to see if there are badblocks?

-Jeff

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

