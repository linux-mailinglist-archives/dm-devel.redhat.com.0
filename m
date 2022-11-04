Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF2161ED10
	for <lists+dm-devel@lfdr.de>; Mon,  7 Nov 2022 09:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667810418;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8b1Im7u5xfZnECzn/dqviExAYhlR88i0s8miSnj9CGU=;
	b=NFxk1XbKcIIrqqQesFstpMrhSu0UzYa/pNabElwsVY7WsjO8k2PWGsL+3KM0G3CvZUUf1C
	anjmDszVB1xsGFUUbRVN5O8FrTPkrRwBoSx93VItYIMO0EUwckynn/FzTqpGZ1QVMSKdXr
	CfWCWBvXStW9MQWv4RmDPK7hZrJ3qkk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-acY_JL_8OUGj8WpdemLZKg-1; Mon, 07 Nov 2022 03:40:14 -0500
X-MC-Unique: acY_JL_8OUGj8WpdemLZKg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2DEE101AA6A;
	Mon,  7 Nov 2022 08:40:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC4132028DC1;
	Mon,  7 Nov 2022 08:40:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1F4301946A43;
	Mon,  7 Nov 2022 08:40:10 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B3A501946586
 for <dm-devel@listman.corp.redhat.com>; Fri,  4 Nov 2022 14:39:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A5AC22166B26; Fri,  4 Nov 2022 14:39:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F1912166B48
 for <dm-devel@redhat.com>; Fri,  4 Nov 2022 14:39:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81A1A86F132
 for <dm-devel@redhat.com>; Fri,  4 Nov 2022 14:39:29 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-xPw6lnOeOcGrrkg9OFyv1Q-1; Fri, 04 Nov 2022 10:39:25 -0400
X-MC-Unique: xPw6lnOeOcGrrkg9OFyv1Q-1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="289697017"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="289697017"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 07:38:19 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="668373765"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="668373765"
Received: from anantsin-mobl2.amr.corp.intel.com (HELO [10.209.97.57])
 ([10.209.97.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 07:38:18 -0700
Message-ID: <1c9a1b86-efef-fa56-4451-ac3348b678bf@intel.com>
Date: Fri, 4 Nov 2022 07:38:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Coiby Xu <coxu@redhat.com>, kexec@lists.infradead.org
References: <20221104113000.487098-1-coxu@redhat.com>
 <20221104113000.487098-5-coxu@redhat.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20221104113000.487098-5-coxu@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Mon, 07 Nov 2022 08:40:06 +0000
Subject: Re: [dm-devel] [RFC v2 4/5] x86/crash: make the page that stores
 the LUKS volume key inaccessible
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
Cc: "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Baoquan He <bhe@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dm-devel@redhat.com,
 Pingfan Liu <kernelfans@gmail.com>, linux-kernel@vger.kernel.org,
 Kairui Song <ryncsn@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Jan Pazdziora <jpazdziora@redhat.com>,
 Thomas Staudt <tstaudt@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dave Young <dyoung@redhat.com>, Milan Broz <gmazyland@gmail.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/4/22 04:29, Coiby Xu wrote:
> +	if (kexec_crash_image->luks_volume_key_addr) {
> +		start = kexec_crash_image->luks_volume_key_addr;
> +		end = start + kexec_crash_image->luks_volume_key_sz - 1;
> +		page = pfn_to_page(start >> PAGE_SHIFT);
> +		nr_pages = (end >> PAGE_SHIFT) - (start >> PAGE_SHIFT) + 1;
> +		set_memory_np((unsigned long)page_address(page), nr_pages);
> +	}

Why does this go pfn -> page -> vaddr?  What good does having the page
do?  Can you just do phys_to_virt() on the start address?  Maybe:

 	start_paddr = kexec_crash_image->luks_volume_key_addr;
 	end_paddr   = start_paddr + kexec_crash_image->luks_volume_key_sz - 1;
 	nr_pages = (PAGE_ALIGN(end_paddr) - PAGE_ALIGN_DOWN(start_paddr))/
PAGE_SIZE;
 	set_memory_np((unsigned long)phys_to_virt(start_paddr), nr_pages);

Also, if you resend this, please just cc the x86 folks on the series.
The other patches and cover letter have desperately needed context
around this.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

