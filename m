Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D71909EF
	for <lists+dm-devel@lfdr.de>; Fri, 16 Aug 2019 23:02:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E648300BEA6;
	Fri, 16 Aug 2019 21:02:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45C9A5D9DC;
	Fri, 16 Aug 2019 21:02:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DDB8C1800202;
	Fri, 16 Aug 2019 21:02:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GL2fax010372 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 17:02:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F3A4A19C6A; Fri, 16 Aug 2019 21:02:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 838A3579E;
	Fri, 16 Aug 2019 21:02:36 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7GL2ZIC009279; 
	Fri, 16 Aug 2019 16:02:35 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7GL2YJI009278;
	Fri, 16 Aug 2019 16:02:34 -0500
Date: Fri, 16 Aug 2019 16:02:34 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20190816210234.GJ25414@octiron.msp.redhat.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-5-git-send-email-bmarzins@redhat.com>
	<944d12858b6fc3660150d03f07ad1126132acaa3.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <944d12858b6fc3660150d03f07ad1126132acaa3.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 04/16] libmultipath: add wrapper function
 around pgpolicyfn
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 16 Aug 2019 21:02:44 +0000 (UTC)

On Wed, Aug 14, 2019 at 09:39:27PM +0000, Martin Wilck wrote:
> On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> > group_paths() is a wrapper around the pgpolicy functions, that pulls
> > out
> > the common code from the beginning and the end. However since
> > one_group() didn't free the mp->paths vector, it has to set it to
> > NULL,
> > to avoid having the wrapper code do that. Also, the pathgroups in
> > group_by_prio are now needlessly sorted afterwards.
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> Reviewed-by: Martin Wilck <mwilck@suse.com>
> 
> (Suggestion: squash this with 07/16, and possibly also 05/16 and
> 06/16).
> 

Sure.

-Ben

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
