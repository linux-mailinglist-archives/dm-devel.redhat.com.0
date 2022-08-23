Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8488559EDBA
	for <lists+dm-devel@lfdr.de>; Tue, 23 Aug 2022 22:48:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661287698;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YpXESkyQN5NZuDzzxTO8EVn2aO4PSmYxFf2T7Iz97rU=;
	b=g0NY07OfOfMqiP021L82Wx55YRhSJ6bmCa9FKlbkmAoXOZGcuNPjuK2Q4HzXlmPptf7wyO
	7zsdcEC1bNFbT96HGh3gbI4fuEgDDQE9wVFoyFs9JLSxaldLYlqeV5U4mrrFJeS9e2ZKIO
	F5R949LFShLNltUF6qpxaCd85S7rRpg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-xzMIh7TJO5Oa91VXtv0rng-1; Tue, 23 Aug 2022 16:48:16 -0400
X-MC-Unique: xzMIh7TJO5Oa91VXtv0rng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDABD803301;
	Tue, 23 Aug 2022 20:48:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53DA32166B26;
	Tue, 23 Aug 2022 20:48:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 575881946A5E;
	Tue, 23 Aug 2022 20:48:07 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 266721946A40
 for <dm-devel@listman.corp.redhat.com>; Tue, 23 Aug 2022 20:48:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 09CBF400DFA6; Tue, 23 Aug 2022 20:48:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6F26404C6DE;
 Tue, 23 Aug 2022 20:48:05 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 27NKm4o2013905;
 Tue, 23 Aug 2022 15:48:04 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 27NKm3sY013904;
 Tue, 23 Aug 2022 15:48:03 -0500
Date: Tue, 23 Aug 2022 15:48:03 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220823204803.GX10602@octiron.msp.redhat.com>
References: <20220818210630.19395-1-mwilck@suse.com>
 <20220818210630.19395-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220818210630.19395-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH 1/3] libmultipath: merge_mptable(): sort
 table by wwid
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
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 18, 2022 at 11:06:28PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> If the mptable is very large (for example, in a configuration with
> lots of maps assigned individual aliases), merge_mptable may get
> very slow because it needs to make O(n^2) string comparisons (with
> n being the number of mptable entries). WWID strings often differ
> only in the last few bytes, causing a lot of CPU time spent in
> strcmp().
> 
> merge_mptable is executed whenever multipath or multipathd is started, that
> is, also for "multipath -u" and "multipath -U" invocations from udev rules.
> Optimize it by sorting the mptable before merging. This way we don't need
> to iterate towards the end of the vector searching for duplicates.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/config.c | 15 +++++++++++++--
>  libmultipath/vector.c |  8 ++++++++
>  libmultipath/vector.h |  1 +
>  3 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/libmultipath/config.c b/libmultipath/config.c
> index ab8b26e..a2c79a4 100644
> --- a/libmultipath/config.c
> +++ b/libmultipath/config.c
> @@ -520,6 +520,14 @@ merge_mpe(struct mpentry *dst, struct mpentry *src)
>  	merge_num(mode);
>  }
>  
> +static int wwid_compar(const void *p1, const void *p2)
> +{
> +	const char *wwid1 = (*(struct mpentry * const *)p1)->wwid;
> +	const char *wwid2 = (*(struct mpentry * const *)p2)->wwid;
> +
> +	return strcmp(wwid1, wwid2);
> +}
> +
>  void merge_mptable(vector mptable)
>  {
>  	struct mpentry *mp1, *mp2;
> @@ -533,10 +541,13 @@ void merge_mptable(vector mptable)
>  			free_mpe(mp1);
>  			continue;
>  		}
> +	}
> +	vector_sort(mptable, wwid_compar);
> +	vector_foreach_slot(mptable, mp1, i) {
>  		j = i + 1;
>  		vector_foreach_slot_after(mptable, mp2, j) {
> -			if (!mp2->wwid || strcmp(mp1->wwid, mp2->wwid))
> -				continue;
> +			if (strcmp(mp1->wwid, mp2->wwid))
> +				break;
>  			condlog(1, "%s: duplicate multipath config section for %s",
>  				__func__, mp1->wwid);
>  			merge_mpe(mp2, mp1);

The way merge_mpe() works, values are only copied from mp1's variables
if the corresponding variable is unset in mp2. This requires the
original order of mp1 and mp2 to be unchanged by the sorting algorithm,
but according to the qsort() man page "If two members compare as equal,
their order in the sorted array is undefined."

One quick and dirty way we could fix this is to add a variable to struct
mptable called config_idx, which is its index in the config file.  If
the wwids are equal, you compare that.

Something like (only compile tested):
------------
diff --git a/libmultipath/config.c b/libmultipath/config.c
index a2c79a48..a8e2620b 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -522,10 +522,15 @@ merge_mpe(struct mpentry *dst, struct mpentry *src)
 
 static int wwid_compar(const void *p1, const void *p2)
 {
+	int r;
 	const char *wwid1 = (*(struct mpentry * const *)p1)->wwid;
 	const char *wwid2 = (*(struct mpentry * const *)p2)->wwid;
+	int idx1 = (*(struct mpentry * const *)p1)->config_idx;
+	int idx2 = (*(struct mpentry * const *)p2)->config_idx;
 
-	return strcmp(wwid1, wwid2);
+	if ((r = strcmp(wwid1, wwid2)) != 0)
+		return r;
+	return idx1 - idx2;
 }
 
 void merge_mptable(vector mptable)
@@ -541,6 +546,7 @@ void merge_mptable(vector mptable)
 			free_mpe(mp1);
 			continue;
 		}
+		mp1->config_idx = i;
 	}
 	vector_sort(mptable, wwid_compar);
 	vector_foreach_slot(mptable, mp1, i) {
diff --git a/libmultipath/config.h b/libmultipath/config.h
index fdcdff0a..fc44914c 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -133,6 +133,7 @@ struct mpentry {
 	uid_t uid;
 	gid_t gid;
 	mode_t mode;
+	int config_idx;
 };
 
 struct config {
------------

-Ben

> diff --git a/libmultipath/vector.c b/libmultipath/vector.c
> index e2d1ec9..0befe71 100644
> --- a/libmultipath/vector.c
> +++ b/libmultipath/vector.c
> @@ -208,3 +208,11 @@ int vector_find_or_add_slot(vector v, void *value)
>  	vector_set_slot(v, value);
>  	return VECTOR_SIZE(v) - 1;
>  }
> +
> +void vector_sort(vector v, int (*compar)(const void *, const void *))
> +{
> +	if (!v || !v->slot || !v->allocated)
> +		return;
> +	return qsort((void *)v->slot, v->allocated, sizeof(void *), compar);
> +
> +}
> diff --git a/libmultipath/vector.h b/libmultipath/vector.h
> index 2862dc2..c0b09cb 100644
> --- a/libmultipath/vector.h
> +++ b/libmultipath/vector.h
> @@ -89,4 +89,5 @@ extern void vector_repack(vector v);
>  extern void vector_dump(vector v);
>  extern void dump_strvec(vector strvec);
>  extern int vector_move_up(vector v, int src, int dest);
> +void vector_sort(vector v, int (*compar)(const void *, const void *));
>  #endif
> -- 
> 2.37.1
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

