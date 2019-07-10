Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1030A64C5D
	for <lists+dm-devel@lfdr.de>; Wed, 10 Jul 2019 20:45:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D240583F51;
	Wed, 10 Jul 2019 18:45:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC9ED5D9CD;
	Wed, 10 Jul 2019 18:45:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8AB7119725;
	Wed, 10 Jul 2019 18:45:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6AIjUHU017385 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Jul 2019 14:45:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D9B760BFB; Wed, 10 Jul 2019 18:45:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1794A60BFC
	for <dm-devel@redhat.com>; Wed, 10 Jul 2019 18:45:27 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4577630C34DF
	for <dm-devel@redhat.com>; Wed, 10 Jul 2019 18:45:26 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x15so3310095wmj.3
	for <dm-devel@redhat.com>; Wed, 10 Jul 2019 11:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=O2Y2nVowkvkgWAlhIe531ZRy97nAvdWytEffN1aqIs8=;
	b=Ozxn/oEnPDwk6KsFEg/v/OCZVyd3N2WnIeXxcvIFStHUAULOh9E4b3iVMI2USLq4qv
	UlAt3AJbKSM+sS9uhgWqj4nF6tdsOlQ4li4LC1JpzOiXMI6joyE3l5wDubvFKb8p5dj8
	TyAS+6aAfQ2Nq8zwu09hbrbutLZYw25JgVWGo/fw3P9mZ2PBSBb5/mnsshKySd6CFQ0V
	8WoOiYq/Fvk5Jr99VjnnzCkPx0uWnxp7srWezNVWllmpFxephC8X1d1qfXpxedZK/QJM
	5a/WMZeBbtw7CyfgxXrp9LMNamzJm9XhmBhrEiIVpT7JQ8aaU8oi3GEWLVYQiGln4f3y
	bB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=O2Y2nVowkvkgWAlhIe531ZRy97nAvdWytEffN1aqIs8=;
	b=o0pW+FOOsvCaPXYA5wx8QWRsNaljUKOretsx/qO2ewxnBJAr0PBhtzsG+X6NY6eWUc
	ePJEBpv9T8Ml6uFKK3ZsxvxootlljT2hEwbjxbLbixrbJ1HE/PyaVwr5Ygmj/prCj944
	9CyIT2FwLu/0A0+jxJu0YIVTyOtJehzry8W2bUJJgP4kLQIjS7hf+zJooHL4KfXRPGpm
	uky3HNf+xseHJBI4ebzdTwUh4EZBVzsczL0b3zi/VWghWBgryb4vsrOqWse3zvG0NDH4
	H45oUYDOuh5pWfbJMKlpkEqfbycaa64DQiUz3K1JPK9yzpDREMTC5cQuLPWBc0YO2sYK
	6I5A==
X-Gm-Message-State: APjAAAVVTgZEjRyonK+M6rN5ompD9bbPCCvqTzBYuSrVA/5l4Oz86t+w
	s1xehA7lFRVQR64FlPhk8sLshdCeUCU=
X-Google-Smtp-Source: APXvYqxfHH5qpsjKfYckgHcUY3MR+qzdDYzchayVv8w7sInJ9v0kves90IqFFMCcfo/pXU39qUTePg==
X-Received: by 2002:a1c:6a17:: with SMTP id f23mr6371998wmc.91.1562784324917; 
	Wed, 10 Jul 2019 11:45:24 -0700 (PDT)
Received: from [192.168.1.116] (77.49.139.23.dsl.dyn.forthnet.gr.
	[77.49.139.23])
	by smtp.gmail.com with ESMTPSA id u6sm3909479wml.9.2019.07.10.11.45.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Jul 2019 11:45:24 -0700 (PDT)
To: Heinz Mauelshagen <heinzm@redhat.com>, snitzer@redhat.com, agk@redhat.com, 
	dm-devel@redhat.com
References: <20190709141522.29606-1-ntsironis@arrikto.com>
	<20190709141522.29606-2-ntsironis@arrikto.com>
	<a6d47841-fcbc-50b2-724c-082be9e764d1@redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <e2b23d5c-0ef2-400b-9697-3fb7899ce3e2@arrikto.com>
Date: Wed, 10 Jul 2019 21:45:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <a6d47841-fcbc-50b2-724c-082be9e764d1@redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 10 Jul 2019 18:45:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 10 Jul 2019 18:45:26 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: 1.294 * (DKIM_SIGNED, DKIM_VALID, PDS_NO_HELO_DNS,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, iliastsi@arrikto.com
Subject: Re: [dm-devel] [RFC PATCH 1/1] dm: add clone target
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 10 Jul 2019 18:45:53 +0000 (UTC)

On 7/10/19 12:28 AM, Heinz Mauelshagen wrote:
> Hi Nikos,
> 
> what is the crucial factor your target offers vs. resynchronizing such a 
> latency distinct
> 2-legged mirror with a read-write snapshot (local, fast exception store) 
> on top, tearing the
> mirror down keeping the local leg once fully in sync and merging the 
> snapshot back into it?
> 
> Heinz
> 

Hi Heinz,

The most significant benefits of dm-clone over the solution you propose
is significantly better performance, no need for extra COW space, no
need to merge back a snapshot, and the ability to skip syncing the
unused space of a file system.

1. In order to ensure snapshot consistency, dm-snapshot needs to
   commit a completed exception, before signaling the completion of the
   write that triggered it to upper layers.

   The persistent exception store commits exceptions every time a
   metadata area is filled or when there are no more exceptions
   in-flight. For a 4K chunk size we have 256 exceptions per metadata
   area, so the best case scenario is one commit per 256 writes. Here I
   assume a write with size equal to the chunk size of dm-snapshot,
   e.g., 4K, so there is no COW overhead, and that we write to new
   chunks, so we need to allocate new exceptions.

   Part of committing the metadata is flushing the cache of the
   underlying device, if there is one. We have seen SSDs which can
   sustain hundreds of thousands of random write IOPS, but they take up
   to 8ms to flush their cache. In such a case, flushing the SSD cache
   every few writes significantly degrades performance.

   Moreover, dm-snapshot forces exceptions to complete in the order they
   were allocated, to avoid snapshot space leak on crash (commit
   230c83afdd9cd). This inserts further latency in exception completions
   and thus user write completions.

   On the other hand, when cloning a device we don't need to be so
   strict and can rely on committing the metadata every time a FLUSH or
   FUA bio is written, or periodically, like dm-thin and dm-cache do.

   dm-clone does exactly that. When a region/chunk is cloned or
   over-written by a write, we just set a bit in the relevant in-core
   bitmap. The metadata are committed once every second or when we
   receive a FLUSH or FUA bio.

   This improves performance significantly and results in increased IOPS
   and reduced latency, especially in cases where flushing the disk
   cache is very expensive.

2. For large devices, e.g. multi terabyte disks, resynchronizing the
   local leg can take a lot of time. If the application running over the
   local device is write-heavy, dm-snapshot will end up allocating a
   large number of exceptions. This increases the number of hash table
   collisions and thus increases the time we need to do a hash table
   lookup.

   dm-snapshot needs to look up the exception hash tables in order to
   service an I/O, so this increases latency and degrades performance.

   On the other hand, dm-clone is just testing a bit to see if a region
   is cloned or not and decides what to do based on that test.

3. With dm-clone there is no need to reserve extra COW space for
   temporarily storing the written data, while the clone device is
   syncing. Nor would one need to worry about monitoring and expanding
   the COW device to prevent it from filling up.

4. With dm-clone there is no need to merge back potentially several
   gigabytes once cloning/syncing completes. We also avoid the relevant
   performance degradation incurred by the merging process. Writes just
   go directly to the clone device.

5. dm-clone implements support for discards, so it can skip
   cloning/syncing the relevant regions. In the case of a large block
   device which contains a filesystem with empty space, e.g. a 2TB
   device containing 500GB of useful data in a filesystem, this can
   significantly reduce the time needed to sync/clone.

This was a rather long email, but I hope it makes the significant
benefits of dm-clone over using dm-snapshot, and our rationale behind
the decision to implement a new target clearer.

I would be more than happy to continue the conversation and focus on any
other questions you may have.

Thanks,
Nikos

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
