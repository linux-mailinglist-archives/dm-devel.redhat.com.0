Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D410C69AC0
	for <lists+dm-devel@lfdr.de>; Mon, 15 Jul 2019 20:22:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03825104C1;
	Mon, 15 Jul 2019 18:22:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1640A6012C;
	Mon, 15 Jul 2019 18:22:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 514A3206D2;
	Mon, 15 Jul 2019 18:22:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6FIMOFH023397 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 15 Jul 2019 14:22:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ADB21600C4; Mon, 15 Jul 2019 18:22:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E3A0600C1;
	Mon, 15 Jul 2019 18:22:22 +0000 (UTC)
Date: Mon, 15 Jul 2019 14:22:21 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20190715182221.GB15315@redhat.com>
References: <20190603134017.9323-1-ntsironis@arrikto.com>
	<b6cdb071-f8d3-7c09-c938-71689ceb1c95@arrikto.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6cdb071-f8d3-7c09-c938-71689ceb1c95@arrikto.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] dm kcopyd: Increase sub-job size to 512KiB
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 15 Jul 2019 18:22:38 +0000 (UTC)

On Fri, Jul 12 2019 at  9:45am -0400,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> Hi Mike,
> 
> A kind reminder about this patch. Do you require any changes or will you
> merge it as is?

I think we need changes to expose knob(s) to tune this value on a global
_and_ device level via sysfs.  E.g.:

1) dm_mod module param for global
2) but also allow a per-device override, like:
   echo 512 > /sys/block/dm-X/dm/kcopyd_subjob_size

1 is super easy and is a start.  Layering in 2 is a bit more involved.

In hindsight (given how risk-averse I am on changing the default) I
should've kept the default 128 but allowed override with modparam
dm_mod.kcopyd_subjob_size=1024

Would this be an OK first step?

If so, we're still in the 5.3 merge window, I'll see what I can do.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
