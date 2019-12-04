Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 74BDB113641
	for <lists+dm-devel@lfdr.de>; Wed,  4 Dec 2019 21:17:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575490664;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=85AS2JUkob8rEkGwrJ0fvklxanHcNzthyDu6N/PVxsg=;
	b=gJgqRKA7/v7l9fMVW1rTwVmmCes1pvqtNZvw4UkAnieIAMcQybdzWG4DQgdt4AV2eVfNG6
	snSmvEFOBdlS9/+CxwgjJj5Tx48mCJtFHXipsNx98S/pwZ0RiAMTwkPxPOO/3szHi6WZoj
	ZVP/QcsEjVVoVR25btnh3UPYGUliez0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-Jtf7orWfMAmysPmJMTNPZw-1; Wed, 04 Dec 2019 15:17:39 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DB4E800D41;
	Wed,  4 Dec 2019 20:17:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA2A2A4B60;
	Wed,  4 Dec 2019 20:17:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1226F180612F;
	Wed,  4 Dec 2019 20:17:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4KHExl027902 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 15:17:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5E6125DA70; Wed,  4 Dec 2019 20:17:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D28555DA32;
	Wed,  4 Dec 2019 20:17:11 +0000 (UTC)
Date: Wed, 4 Dec 2019 15:17:10 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Eric Wheeler <dm-devel@lists.ewheeler.net>
Message-ID: <20191204201710.GA31432@redhat.com>
References: <20191204140742.26273-1-ntsironis@arrikto.com>
	<alpine.LRH.2.11.1912041907490.11561@mx.ewheeler.net>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.11.1912041907490.11561@mx.ewheeler.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, thornber@redhat.com,
	Nikos Tsironis <ntsironis@arrikto.com>, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 0/2] dm thin: Flush data device before
 committing metadata to avoid data corruption
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Jtf7orWfMAmysPmJMTNPZw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Dec 04 2019 at  2:58pm -0500,
Eric Wheeler <dm-devel@lists.ewheeler.net> wrote:

> On Wed, 4 Dec 2019, Nikos Tsironis wrote:
> 
> > The thin provisioning target maintains per thin device mappings that map
> > virtual blocks to data blocks in the data device.
> > 
> > When we write to a shared block, in case of internal snapshots, or
> > provision a new block, in case of external snapshots, we copy the shared
> > block to a new data block (COW), update the mapping for the relevant
> > virtual block and then issue the write to the new data block.
> > 
> > Suppose the data device has a volatile write-back cache and the
> > following sequence of events occur:
> 
> For those with NV caches, can the data disk flush be optional (maybe as a 
> table flag)?

IIRC block core should avoid issuing the flush if not needed.  I'll have
a closer look to verify as much.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

