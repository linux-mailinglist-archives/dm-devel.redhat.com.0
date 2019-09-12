Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B22AEB100D
	for <lists+dm-devel@lfdr.de>; Thu, 12 Sep 2019 15:34:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 376BA307D925;
	Thu, 12 Sep 2019 13:34:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57C2660872;
	Thu, 12 Sep 2019 13:34:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D125324F30;
	Thu, 12 Sep 2019 13:34:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8CDXl95012837 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 12 Sep 2019 09:33:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4768860C57; Thu, 12 Sep 2019 13:33:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45AB460C5D;
	Thu, 12 Sep 2019 13:33:41 +0000 (UTC)
Date: Thu, 12 Sep 2019 09:33:40 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20190912133339.GA5709@redhat.com>
References: <20190912121137.26567-1-ntsironis@arrikto.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190912121137.26567-1-ntsironis@arrikto.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, dm-devel@redhat.com, agk@redhat.com,
	iliastsi@arrikto.com
Subject: Re: [dm-devel] [PATCH 0/2] dm clone: Minor fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Thu, 12 Sep 2019 13:34:26 +0000 (UTC)

On Thu, Sep 12 2019 at  8:11am -0400,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> Hi Mike,
> 
> I examined the diff between v3 of dm-clone and the staged version and it
> looks fine.
> 
> This patch set includes some minor fixes to fold in:
> 
>   - Rename 'md' to 'cmd' also in dm-clone-metadata.h, to be consistent
>     with the changes in dm-clone-metadata.c
> 
>   - Explicitly include the header file for kvmalloc(). This is not
>     strictly required, as the header file is included indirectly by
>     other header files, but I think it's safer to include it anyway.

I've folded these in via rebase.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
