Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 475531C2CD3
	for <lists+dm-devel@lfdr.de>; Sun,  3 May 2020 15:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588513148;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2s7Fjdx76QJMzWaVSEq5i/aBIrEhG/6tST+iD3XG3iY=;
	b=isyOKBptVU1QlB/qtDi6aCKOpuQ8QaGkTMgRk/X4R0NcBnTUgB7dmx0ferwG8UUMZgEBcE
	rpdtAeFw9Md2X+GIQ2Oni8fL/WteU0IDfnhMMZGNUobSyUEzaJBuoqw+VR2qHd3YbKJgiS
	/JbJVP+b/4mXfdejePjU0forQsd7O9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-2CyY_LcVMZSRDa81g0jDfg-1; Sun, 03 May 2020 09:39:05 -0400
X-MC-Unique: 2CyY_LcVMZSRDa81g0jDfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ACED1005510;
	Sun,  3 May 2020 13:38:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B3F11001B2C;
	Sun,  3 May 2020 13:38:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0645C1809542;
	Sun,  3 May 2020 13:38:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 043DcRRO007126 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 3 May 2020 09:38:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 762B35C6DC; Sun,  3 May 2020 13:38:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B55B5C48C;
	Sun,  3 May 2020 13:38:22 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@redhat.com>)
	id 1jVEp2-0003gB-Q3; Sun, 03 May 2020 14:38:20 +0100
Date: Sun, 3 May 2020 14:38:20 +0100
From: Alasdair G Kergon <agk@redhat.com>
To: Dongyang Zhan <zdyzztq@gmail.com>
Message-ID: <20200503133820.GA14134@agk-dp.fab.redhat.com>
Mail-Followup-To: Dongyang Zhan <zdyzztq@gmail.com>,
	Alasdair Kergon <agk@redhat.com>,
	"M: Mike Snitzer" <snitzer@redhat.com>, dm-devel@redhat.com
References: <CAFSR4cuCx-wGOAVPUPh8+V4FqDP2Nvac0OeQL6onG89JnZTpyQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFSR4cuCx-wGOAVPUPh8+V4FqDP2Nvac0OeQL6onG89JnZTpyQ@mail.gmail.com>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Peninsular House, 30-36 Monument
	Street, 4th Floor, London, England, EC3R 8NB.
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, "M: Mike Snitzer" <snitzer@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] Possible null pointer dereference in __rh_alloc()
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

On Sun, May 03, 2020 at 03:02:21PM +0800, Dongyang Zhan wrote:
>  I am a security researcher, my name is Dongyang Zhan. I found a potential bug in
>  /drivers/md/dm-region-hash.c in Linux 4.10.17. I hope you can help me to confirm it.
>  __rh_alloc() in /drivers/md/dm-region-hash.c mishandles the memory allocation failures of nreg.
>  Source code:
>  struct dm_region *reg, *nreg;
>  nreg = mempool_alloc(rh->region_pool, GFP_ATOMIC);
>  if (unlikely(!nreg))
>                  nreg = kmalloc(sizeof(*nreg), GFP_NOIO | __GFP_NOFAIL);
>  nreg->state = rh->log->type->in_sync(rh->log, region, 1) ?
>                  DM_RH_CLEAN : DM_RH_NOSYNC;
>  If the statement (nreg = kmalloc(sizeof(*nreg), GFP_NOIO | __GFP_NOFAIL);) fails,
>  dereferencing this pointer (nreg->state) will cause null pointer dereference.

 * %__GFP_NOFAIL: The VM implementation _must_ retry infinitely: the caller
 * cannot handle allocation failures. The allocation could block
 * indefinitely but will never return with failure. Testing for
 * failure is pointless.

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

