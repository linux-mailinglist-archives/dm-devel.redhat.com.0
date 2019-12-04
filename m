Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5CF112FD0
	for <lists+dm-devel@lfdr.de>; Wed,  4 Dec 2019 17:17:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575476271;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cDEu6oV/cVLg0O8DgVwiEN2/6o1JqZnfM8KM6OHMmuE=;
	b=LMJafMdLs2CVPoj6Wt/cyZC18VtVL7X2WbRLaK2dOYIBvfB0V2B3uUtJLprOsQSpNNy4fj
	6i2NoJvhbYC84tkcBzR4kxXvaF3k1kr/kWV7LZZ3xEfeffg5vDmaZkFFNRcL851LuA1uAK
	s45qkOXoWjk5v76Dq5kbi+f8YJRsXbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-Z7xOIvTLMOO_F0q96Wm5bw-1; Wed, 04 Dec 2019 11:17:49 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24336800EB9;
	Wed,  4 Dec 2019 16:17:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F99B10016E8;
	Wed,  4 Dec 2019 16:17:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3356765D1D;
	Wed,  4 Dec 2019 16:17:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4GHMli015444 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 11:17:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 292F32026D68; Wed,  4 Dec 2019 16:17:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 241A12063205
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 16:17:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86BD38E316F
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 16:17:19 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-264-_ZDavwOmPNeRgHT4QqgKog-1; Wed, 04 Dec 2019 11:17:17 -0500
Received: by mail-lj1-f195.google.com with SMTP id d20so8733625ljc.12
	for <dm-devel@redhat.com>; Wed, 04 Dec 2019 08:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=y7+Bi+/Xn5i+jS8lyj/HgTrUbZBQcSmtns1YTS7XhGE=;
	b=evD4TxzX41UeqdC6YfuyjqgznwnnpNvAgzVnbgUzcO0aw7i64tunpLjHZ6cNMZMXyQ
	ruT8eH07noExOzRC/ffFsbS1HQDPqAgXJqxy61A/eVkuS2/Gtus0pLYjuTg2BGSZ7Ho4
	qtWsapS+SaO9TzWUnxmyeLeVdbd0LRDxahlwTFw4MddFVr8ElE3oU20HUUdAApRvYPvS
	wkaaksaB1MAYPsgn7VSmk5g9BXb3uCMF3livpaS5a3YqLmeJv4jOEKVPI6xH7iDLsCW1
	5cFmJGt2k+/S5tJXNzGRBUUJgPpamhWJdGL9Mjej/67rTOrGMnPngVecl5ZB+sIpmxxu
	b5xQ==
X-Gm-Message-State: APjAAAXpan+ZKQbCBHd3eaGN+qVnwKP2Y+OAZEHcKJQXLknrJEyY9ld5
	3+UY07hV5GDn3DqgsZt3dZ5sOg==
X-Google-Smtp-Source: APXvYqzYb3qo07AokelIXneP0cQWTKC2HrbFtWrnZORHzoL1wYn+pCXx+9KbPY39vnL3sDCWItLNWQ==
X-Received: by 2002:a05:651c:1066:: with SMTP id
	y6mr2578864ljm.96.1575476233097; 
	Wed, 04 Dec 2019 08:17:13 -0800 (PST)
Received: from [10.94.250.133] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id d9sm868441lja.73.2019.12.04.08.17.12
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 04 Dec 2019 08:17:12 -0800 (PST)
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com,
	thornber@redhat.com
References: <20191204140742.26273-1-ntsironis@arrikto.com>
	<20191204140742.26273-3-ntsironis@arrikto.com>
	<20191204152759.qhh2f6ybhww7ivel@reti>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <4627d4b3-fced-0d22-34c5-258733c9afa9@arrikto.com>
Date: Wed, 4 Dec 2019 18:17:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191204152759.qhh2f6ybhww7ivel@reti>
Content-Language: en-US
X-MC-Unique: _ZDavwOmPNeRgHT4QqgKog-1
X-MC-Unique: Z7xOIvTLMOO_F0q96Wm5bw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 2/2] dm thin: Flush data device before
	committing metadata
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 12/4/19 5:27 PM, Joe Thornber wrote:
> On Wed, Dec 04, 2019 at 04:07:42PM +0200, Nikos Tsironis wrote:
>> The thin provisioning target maintains per thin device mappings that map
>> virtual blocks to data blocks in the data device.
> 
> 
> Ack.  But I think we're issuing the FLUSH twice with your patch.  Since the
> original bio is still remapped and issued at the end of process_deferred_bios?
> 

Yes, that's correct. I thought of it and of putting a check in
process_deferred_bios() to complete FLUSH bios immediately, but I have
one concern and I preferred to be safe than sorry.

In __commit_transaction() there is the following check:

   if (unlikely(!pmd->in_service))
             return 0;

, which means we don't commit the metadata, and thus we don't flush the
data device, in case the pool is not in service.

Opening a thin device doesn't seem to put the pool in service, since
dm_pool_open_thin_device() uses pmd_write_lock_in_core().

Can I assume that the pool is in service if I/O can be mapped to a thin
device? If so, it's safe to put such a check in process_deferred_bios().

On second thought though, in order for a flush bio to end up in
deferred_flush_bios in the first place, someone must have changed the
metadata and thus put the pool in service. Otherwise, it would have been
submitted directly to the data device. So, it's probably safe to check
for flush bios after commit() in process_deferred_bios() and complete
them immediately.

If you confirm too that this is safe, I will send a second version of
the patch adding the check.

Thanks,
Nikos

> - Joe
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

