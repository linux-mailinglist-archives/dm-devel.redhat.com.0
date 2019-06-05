Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AC635F61
	for <lists+dm-devel@lfdr.de>; Wed,  5 Jun 2019 16:36:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6927C30860D7;
	Wed,  5 Jun 2019 14:35:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4596F1017E3A;
	Wed,  5 Jun 2019 14:35:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E39C31806B0F;
	Wed,  5 Jun 2019 14:35:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x55EY0Fc002803 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Jun 2019 10:34:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A350B18A75; Wed,  5 Jun 2019 14:34:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6299360566;
	Wed,  5 Jun 2019 14:33:56 +0000 (UTC)
Date: Wed, 5 Jun 2019 10:33:55 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Eyal Ben-David <EYALBE@il.ibm.com>
Message-ID: <20190605143355.GA734@redhat.com>
References: <OFE5B87F49.B857DE99-ONC225840F.00284A78-C225840F.00292455@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFE5B87F49.B857DE99-ONC225840F.00284A78-C225840F.00292455@notes.na.collabserv.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] Automatic blacklisting of NVMe devices if NVMe
	native MP
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Wed, 05 Jun 2019 14:36:33 +0000 (UTC)

On Tue, Jun 04 2019 at  3:29am -0400,
Eyal Ben-David <EYALBE@il.ibm.com> wrote:

>    Hi all,
> 
>    Is it possible to automatically blacklist all NVMe devices if the NVMe
>    driver has it's own multipath?
> 
>    I mean if for example if:
> 
>    cat /sys/module/nvme_core/parameters/multipath
>    Y
> 
>    then device mapper would automatically blacklist all NVMe devices to avoid
>    unexpected consequences.

The native NVMe multipath device would only look to have one path from
above.  So multipath shouldn't even pick up these native NVMe multipath
devices.  And in addition, IIRC, multipath-tools has been trained to at
least recognize native NVMe multipath device and displays useful info
about them.

Have you seen an actual problem?  What versions of kernel and
multipath-tools are you using?

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
