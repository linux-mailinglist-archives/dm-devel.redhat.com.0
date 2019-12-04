Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC93112E62
	for <lists+dm-devel@lfdr.de>; Wed,  4 Dec 2019 16:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575473322;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7y0/80Zj7ltCXN6nrU2jWxThPQz6/wQA2kPyBcZy8fM=;
	b=eXXXJRU05xHH+dOTpNC384i6YwDIElzh7C5SFRAIS5oO8XNuNhW6Mt1HRWVS08WlTflBpc
	9bUXx9kKHC7TPT/41aWEM7vJBACHnARpkBPDl4bhWAB/IuGcd9tUs6rLTrViRNPsHbJ1++
	zsNcrOaw18CpsykOBUyOEZAx8EZx0KY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-D-Ei0qt-PAO_cKireyCJEg-1; Wed, 04 Dec 2019 10:28:41 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6069800D54;
	Wed,  4 Dec 2019 15:28:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43329600C8;
	Wed,  4 Dec 2019 15:28:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C26562CF0;
	Wed,  4 Dec 2019 15:28:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4FS5DY012715 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 10:28:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 55CF919C7F; Wed,  4 Dec 2019 15:28:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.33.36.177])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C76C19C68;
	Wed,  4 Dec 2019 15:27:59 +0000 (UTC)
Date: Wed, 4 Dec 2019 15:27:59 +0000
From: Joe Thornber <thornber@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20191204152759.qhh2f6ybhww7ivel@reti>
Mail-Followup-To: Nikos Tsironis <ntsironis@arrikto.com>,
	snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
References: <20191204140742.26273-1-ntsironis@arrikto.com>
	<20191204140742.26273-3-ntsironis@arrikto.com>
MIME-Version: 1.0
In-Reply-To: <20191204140742.26273-3-ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, agk@redhat.com, snitzer@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: D-Ei0qt-PAO_cKireyCJEg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Dec 04, 2019 at 04:07:42PM +0200, Nikos Tsironis wrote:
> The thin provisioning target maintains per thin device mappings that map
> virtual blocks to data blocks in the data device.


Ack.  But I think we're issuing the FLUSH twice with your patch.  Since the
original bio is still remapped and issued at the end of process_deferred_bios?

- Joe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

