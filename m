Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9057E6C7FD1
	for <lists+dm-devel@lfdr.de>; Fri, 24 Mar 2023 15:25:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679667923;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4Yvbn98JtOseoaj1LjCvH+1cu+tpWEItbB8AsZnSBNw=;
	b=aIZ1qMPsKu6l4QZfJhQ9aYlnx65q3D/F99hr2i/39tqINBsU6UefbwUD7dzeiVUf7PVOng
	DylOkqeDE84vsDoT88tNgSiUqhh7wXPaqtJept/glpZJy27i6F6bumjjs/hkt6zprUVyuQ
	I6YeTMJ9yQLXNhqlkwYrl6XU1cBXbR4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-cEipe7EHPMiHRhTDZSPeXA-1; Fri, 24 Mar 2023 10:25:21 -0400
X-MC-Unique: cEipe7EHPMiHRhTDZSPeXA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F39021C0951D;
	Fri, 24 Mar 2023 14:25:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A11D9140EBF4;
	Fri, 24 Mar 2023 14:25:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 446C11946A6C;
	Fri, 24 Mar 2023 14:25:09 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5D3E61946A5A
 for <dm-devel@listman.corp.redhat.com>; Fri, 24 Mar 2023 14:25:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3CD7E2166B2A; Fri, 24 Mar 2023 14:25:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DBD02166B29;
 Fri, 24 Mar 2023 14:25:07 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 32OEP3QT003665;
 Fri, 24 Mar 2023 09:25:04 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 32OEP3HP003664;
 Fri, 24 Mar 2023 09:25:03 -0500
Date: Fri, 24 Mar 2023 09:25:03 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20230324142503.GM19878@octiron.msp.redhat.com>
References: <DB68C384-BA3A-40E8-9223-4868EE30B68A@purestorage.com>
 <e52c66c71e3a3f25412c86763af8de9fadbfd3c8.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <e52c66c71e3a3f25412c86763af8de9fadbfd3c8.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [dm-devel] [PATCH] libmultipathd Avoid parsing errors due to
 unsupported designators
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "brian@purestorage.com" <brian@purestorage.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 23, 2023 at 08:23:24PM +0000, Martin Wilck wrote:
> On Mon, 2023-03-20 at 12:22 -0700, Brian Bunker wrote:
> > Unsupported designators, even if they are correct, will result
> > in parsing errors. Add support for these two:
> > 
> > Logical Unit Group (0x6)
> > Vendor Specific (0x0)
> > 
> > Mar 20 13:37:35 init107-18 multipath[45016]: parse_vpd_pg83:
> > invalid device designator at offset 87: 01060004
> > Mar 20 13:37:35 init107-18 multipath[45016]: parse_vpd_pg83:
> > invalid device designator at offset 131: 02000005
> > 
> > Thanks,
> > Brian
> 
> Thanks. I've modified your patch as attached.
> 
> Martin
> 

> From 9edbc2b6154786a9e7bb38890d023301c65c8a6a Mon Sep 17 00:00:00 2001
> From: Brian Bunker <brian@purestorage.com>
> Date: Mon, 20 Mar 2023 12:22:02 -0700
> Subject: [PATCH] libmultipathd Avoid parsing errors due to unsupported
>  designators
> 
> Unsupported designators, even if they are correct, will result
> in parsing errors. Add support for these two:
> 
> Logical Unit Group (0x6)
> Vendor Specific (0x0)
> 
> Mar 20 13:37:35 init107-18 multipath[45016]: parse_vpd_pg83:
> invalid device designator at offset 87: 01060004
> Mar 20 13:37:35 init107-18 multipath[45016]: parse_vpd_pg83:
> invalid device designator at offset 131: 02000005
> 
> Thanks,
> Brian
> 
> mwilck: added descriptor type 7 (MD5) for completeness.
> 
> Signed-off-by: Brian Bunker <brian@purestorage.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> ---
>  libmultipath/discovery.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index 3a5ba17..6865cd9 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -1211,6 +1211,17 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
>  			invalid = (d[3] < 8);
>  			new_prio = 2;
>  			break;
> +		case 0x6:
> +			/* Logical Unit Group */
> +			invalid = (d[3] != 4);
> +			break;
> +		case 0x7:
> +			/* MD5 logical unit designator */
> +			invalid = (d[3] != 16);
> +			break;
> +		case 0x0:
> +			/* Vendor Specific */
> +			break;
>  		case 0xa:
>  			condlog(2, "%s: UUID identifiers not yet supported",
>  				__func__);
> -- 
> 2.39.2
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

