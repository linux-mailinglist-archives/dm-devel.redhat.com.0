Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 143032685C2
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 09:24:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-rNxwoEQLO7yGsU5Suc8TSA-1; Mon, 14 Sep 2020 03:24:55 -0400
X-MC-Unique: rNxwoEQLO7yGsU5Suc8TSA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E35A801ADD;
	Mon, 14 Sep 2020 07:24:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3984A100238C;
	Mon, 14 Sep 2020 07:24:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC5D98C7BB;
	Mon, 14 Sep 2020 07:24:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08A9IhlG014495 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 05:18:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D2AF610054C3; Thu, 10 Sep 2020 09:18:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD71710054D1
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 09:18:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B3AA811E7F
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 09:18:41 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-531-6WUgpSfsPz61RA6W1-4Kjg-1; Thu, 10 Sep 2020 05:18:39 -0400
X-MC-Unique: 6WUgpSfsPz61RA6W1-4Kjg-1
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	08A92VZh043273
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 05:18:38 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 33fh5s0eup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 05:18:37 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08A92b38043665
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 05:18:37 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
	[149.81.74.107])
	by mx0a-001b2d01.pphosted.com with ESMTP id 33fh5s0etk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 10 Sep 2020 05:18:37 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	08A9DDHx028675; Thu, 10 Sep 2020 09:18:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
	(b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03fra.de.ibm.com with ESMTP id 33c2a8bckn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 10 Sep 2020 09:18:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 08A9GxlP65470906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 10 Sep 2020 09:16:59 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C217AE055;
	Thu, 10 Sep 2020 09:18:32 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 299C6AE04D;
	Thu, 10 Sep 2020 09:18:30 +0000 (GMT)
Received: from oc4120165700.ibm.com (unknown [9.145.14.177])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 10 Sep 2020 09:18:30 +0000 (GMT)
From: Steffen Maier <maier@linux.ibm.com>
To: Joe Perches <joe@perches.com>, LKML <linux-kernel@vger.kernel.org>,
	Jiri Kosina <trivial@kernel.org>, Benjamin Block <bblock@linux.ibm.com>
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
Message-ID: <0c66fbe5-c48b-7dc1-f7fe-1498da9cc1a3@linux.ibm.com>
Date: Thu, 10 Sep 2020 11:18:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-09-10_01:2020-09-10,
	2020-09-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	lowpriorityscore=0
	phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
	spamscore=0
	mlxlogscore=999 adultscore=0 bulkscore=0 clxscore=1011 mlxscore=0
	malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009100080
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:23:33 -0400
Cc: linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
	oss-drivers@netronome.com, nouveau@lists.freedesktop.org,
	alsa-devel <alsa-devel@alsa-project.org>,
	dri-devel@lists.freedesktop.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org,
	linux-i2c@vger.kernel.org, sparclinux@vger.kernel.org,
	kvmarm@lists.cs.columbia.edu, linux-rtc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-afs@lists.infradead.org, coreteam@netfilter.org,
	intel-wired-lan@lists.osuosl.org, linux-serial@vger.kernel.org,
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
	Kees Cook <kees.cook@canonical.com>, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	linux-sctp@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-nvme@lists.infradead.org, storagedev@microchip.com,
	ceph-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-nfs@vger.kernel.org, linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
	netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
	bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [dm-devel] [trivial PATCH] treewide: Convert switch/case
 fallthrough; to break;
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/9/20 10:06 PM, Joe Perches wrote:
> fallthrough to a separate case/default label break; isn't very readable.
> 
> Convert pseudo-keyword fallthrough; statements to a simple break; when
> the next label is case or default and the only statement in the next
> label block is break;
> 
> Found using:
> 
> $ grep-2.5.4 -rP --include=*.[ch] -n "fallthrough;(\s*(case\s+\w+|default)\s*:\s*){1,7}break;" *
> 
> Miscellanea:
> 
> o Move or coalesce a couple label blocks above a default: block.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> 
> Compiled allyesconfig x86-64 only.
> A few files for other arches were not compiled.

>   drivers/s390/scsi/zfcp_fsf.c                              |  2 +-

>   82 files changed, 109 insertions(+), 112 deletions(-)

> diff --git a/drivers/s390/scsi/zfcp_fsf.c b/drivers/s390/scsi/zfcp_fsf.c
> index 140186fe1d1e..2741a07df692 100644
> --- a/drivers/s390/scsi/zfcp_fsf.c
> +++ b/drivers/s390/scsi/zfcp_fsf.c
> @@ -2105,7 +2105,7 @@ static void zfcp_fsf_open_lun_handler(struct zfcp_fsf_req *req)
>   
>   	case FSF_PORT_HANDLE_NOT_VALID:
>   		zfcp_erp_adapter_reopen(adapter, 0, "fsouh_1");
> -		fallthrough;
> +		break;
>   	case FSF_LUN_ALREADY_OPEN:
>   		break;
>   	case FSF_PORT_BOXED:

Acked-by: Steffen Maier <maier@linux.ibm.com> # for zfcp


-- 
Mit freundlichen Gruessen / Kind regards
Steffen Maier

Linux on IBM Z Development

https://www.ibm.com/privacy/us/en/
IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Matthias Hartmann
Geschaeftsfuehrung: Dirk Wittkopp
Sitz der Gesellschaft: Boeblingen
Registergericht: Amtsgericht Stuttgart, HRB 243294

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

