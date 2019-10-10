Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A0D2FB3
	for <lists+dm-devel@lfdr.de>; Thu, 10 Oct 2019 19:38:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 419BAC034E71;
	Thu, 10 Oct 2019 17:38:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00B1C100EBA5;
	Thu, 10 Oct 2019 17:38:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D6094A486;
	Thu, 10 Oct 2019 17:38:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9AHbcdr004994 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Oct 2019 13:37:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0FA3E5C22F; Thu, 10 Oct 2019 17:37:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F1275C1D8;
	Thu, 10 Oct 2019 17:37:33 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 694931DB6;
	Thu, 10 Oct 2019 17:37:32 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D11F82BD;
	Thu, 10 Oct 2019 17:37:31 +0000 (UTC)
Date: Thu, 10 Oct 2019 11:37:30 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Bryan Gurney <bgurney@redhat.com>
Message-ID: <20191010113730.3f0da042@lwn.net>
In-Reply-To: <1570469089-31554-1-git-send-email-bgurney@redhat.com>
References: <1570469089-31554-1-git-send-email-bgurney@redhat.com>
Organization: LWN.net
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Thu, 10 Oct 2019 17:37:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Thu, 10 Oct 2019 17:37:32 +0000 (UTC) for IP:'45.79.88.28'
	DOMAIN:'ms.lwn.net' HELO:'ms.lwn.net' FROM:'corbet@lwn.net' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 45.79.88.28 ms.lwn.net 45.79.88.28 ms.lwn.net
	<corbet@lwn.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, agk@redhat.com, snitzer@redhat.com,
	linux-doc@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v2] dm dust: convert documentation to ReST
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 10 Oct 2019 17:38:27 +0000 (UTC)

On Mon,  7 Oct 2019 13:24:49 -0400
Bryan Gurney <bgurney@redhat.com> wrote:

> Convert the dm-dust documentation to ReST formatting, using literal
> blocks for all of the shell command, shell output, and log output
> examples.
> 
> Add dm-dust to index.rst.
> 
> Additionally, fix an annotation in the "querying for specific bad
> blocks" section, on the "queryblock ... not found in badblocklist"
> example, to properly state that the message appears when a given
> block is not found.
> 
> Signed-off-by: Bryan Gurney <bgurney@redhat.com>

Applied, thanks.

jon

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
