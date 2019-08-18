Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F75B918EA
	for <lists+dm-devel@lfdr.de>; Sun, 18 Aug 2019 20:35:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EC59308FBFC;
	Sun, 18 Aug 2019 18:35:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F7C15FCA3;
	Sun, 18 Aug 2019 18:35:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E688246F4A;
	Sun, 18 Aug 2019 18:34:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7IIXEdx003734 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 18 Aug 2019 14:33:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1282884F1; Sun, 18 Aug 2019 18:33:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ED905FCA3;
	Sun, 18 Aug 2019 18:33:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D144A30842A1;
	Sun, 18 Aug 2019 18:33:08 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DD0232086C;
	Sun, 18 Aug 2019 18:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566153188;
	bh=Gqov0ByldLScgcrqzd/H8gBTaJeTe4Uu8ql0g/Y44TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZMq9w3enldGraaysVpNPovwHqa1IbCnT9dvyjZ0YkNJczIWGixIqn9pmKArODJdd
	QJoS1XQNYUhWfE6LNEK/CD1wKX+K+vGNp4x+cvGoI0U3O9IkQJUIPXb2+poTMtbweZ
	Qj+/yw51IEzUH/m81azXCBIu+27oFaT23trsMnog=
Date: Sun, 18 Aug 2019 20:33:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Salvatore Bonaccorso <carnil@debian.org>
Message-ID: <20190818183305.GA1181@kroah.com>
References: <20190818155941.GA26766@eldamar.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190818155941.GA26766@eldamar.local>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Sun, 18 Aug 2019 18:33:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Sun, 18 Aug 2019 18:33:08 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'gregkh@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -5.001  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<gregkh@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
	Chris Hofstaedtler <zeha@debian.org>, dm-devel@redhat.com,
	stable@vger.kernel.org, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] Backport request for bcb44433bba5 ("dm: disable
 DISCARD if the underlying storage no longer supports it")
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Sun, 18 Aug 2019 18:35:21 +0000 (UTC)

On Sun, Aug 18, 2019 at 05:59:41PM +0200, Salvatore Bonaccorso wrote:
> Hi
> 
> In Debian bug https://bugs.debian.org/934331 ran into issues which
> match the upstream commit bcb44433bba5 ("dm: disable DISCARD if the
> underlying storage no longer supports it").
> 
> This commit was CC'ed to stable, but only got applied in v5.0.8 (and
> later on backported by Ben Hutchings to v3.16.72).
> 
> Mike, I have not checked how easily that would be for older stable
> versions, but can the backport be considered for versions down to 4.9?
> Apparently Ben did succeed with some changes needed. To 4.19 it should
> apply with a small conflict in drivers/md/dm-core.h AFAICS.

If someone sends the backports to the list, I will be glad to queue them
up.

thanks,

greg k-h

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
