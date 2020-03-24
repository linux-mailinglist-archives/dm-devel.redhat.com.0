Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 718081919AF
	for <lists+dm-devel@lfdr.de>; Tue, 24 Mar 2020 20:12:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585077152;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fDqJmfaIZ8Ax3Wiew/mEWoKIoOK8sV/ApT1C1kdBXiE=;
	b=aFDpW+LISjJLEsltXgoPGLnUY2SXekZ1itw/3C++mSKdC+R2q+oOnGkdqFqmq4bvk5iDz9
	mmFbHg1wUh0lG80ho4nwa+NOmlwFAd/x/+Rsy7oZbC/j9FSxpn6v/ft8MxgIEk8ZrXgZ5e
	3NVeRAmEfO7Twqmsx7rCSzRydzsUJ+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-DH9-3e2BOQmUPGZOgZQ6nQ-1; Tue, 24 Mar 2020 15:12:29 -0400
X-MC-Unique: DH9-3e2BOQmUPGZOgZQ6nQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FA88801E6D;
	Tue, 24 Mar 2020 19:12:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ACBF1001B3F;
	Tue, 24 Mar 2020 19:12:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32EB186382;
	Tue, 24 Mar 2020 19:12:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02OJBrEN003334 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 15:11:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E67C60C18; Tue, 24 Mar 2020 19:11:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4871660BF3;
	Tue, 24 Mar 2020 19:11:50 +0000 (UTC)
Date: Tue, 24 Mar 2020 15:11:49 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Message-ID: <20200324191148.GA2921@redhat.com>
References: <20200227142601.61f3cd54@luklap> <20200324171821.GA2444@redhat.com>
	<20200324195912.518dc87c@luklap>
MIME-Version: 1.0
In-Reply-To: <20200324195912.518dc87c@luklap>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel <dm-devel@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v2] dm-integrity: Prevent RMW for full
 metadata buffer writes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Mar 24 2020 at  2:59pm -0400,
Lukas Straub <lukasstraub2@web.de> wrote:

> On Tue, 24 Mar 2020 13:18:22 -0400
> Mike Snitzer <snitzer@redhat.com> wrote:
> 
> > On Thu, Feb 27 2020 at  8:26am -0500,
> > Lukas Straub <lukasstraub2@web.de> wrote:
> > 
> > > If a full metadata buffer is being written, don't read it first. This
> > > prevents a read-modify-write cycle and increases performance on HDDs
> > > considerably.
> > > 
> > > To do this we now calculate the checksums for all sectors in the bio in one
> > > go in integrity_metadata and then pass the result to dm_integrity_rw_tag,
> > > which now checks if we overwrite the whole buffer.
> > > 
> > > Benchmarking with a 5400RPM HDD with bitmap mode:
> > > integritysetup format --no-wipe --batch-mode --interleave-sectors $((64*1024)) -t 4 -s 512 -I crc32c -B /dev/sdc
> > > integritysetup open --buffer-sectors=1 -I crc32c -B /dev/sdc hdda_integ
> > > dd if=/dev/zero of=/dev/mapper/hdda_integ bs=64K count=$((16*1024*4)) conv=fsync oflag=direct status=progress
> > > 
> > > Without patch:
> > > 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 400.326 s, 10.7 MB/s
> > > 
> > > With patch:
> > > 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 41.2057 s, 104 MB/s
> > > 
> > > Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> > > ---
> > > Hello Everyone,
> > > So here is v2, now checking if we overwrite a whole metadata buffer instead
> > > of the (buggy) check if we overwrite a whole tag area before.
> > > Performance stayed the same (with --buffer-sectors=1).
> > > 
> > > The only quirk now is that it advertises a very big optimal io size in the
> > > standard configuration (where buffer_sectors=128). Is this a Problem?
> > > 
> > > v2:
> > >  -fix dm_integrity_rw_tag to check if we overwrite a whole metadat buffer
> > >  -fix optimal io size to check if we overwrite a whole metadata buffer
> > > 
> > > Regards,
> > > Lukas Straub  
> > 
> > 
> > Not sure why you didn't cc Mikulas but I just checked with him and he
> > thinks:
> > 
> > You're only seeing a boost because you're using 512-byte sector and
> > 512-byte buffer. Patch helps that case but hurts in most other cases
> > (due to small buffers).
> 
> Hmm, buffer-sectors is still user configurable. If the user wants fast
> write performance on slow HDDs he can set a small buffer-sector and
> benefit from this patch. With the default buffer-sectors=128 it
> shouldn't have any impact.

OK, if you'd be willing to conduct tests to prove there is no impact
with larger buffers that'd certainly help reinforce your position and
make it easier for me to take your patch.

But if you're just testing against slow HDD testbeds then the test
coverage isn't wide enough.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

